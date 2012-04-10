ActiveAdmin.register Product do
 menu :label => "My Products"
 #menu :parent => "List"
menu :label => "products", :parent => "Dashboard" #here the default parent is dashboard inthat you can see submenu as products
scope :approved #scope function in models/product.rb 
sidebar :help do  #for adding the sidebar in the place of help we can give any name that acts 				as heading for side bar
    "Need help? Email us at help@example.com"
  end

 action_item do
      link_to "View Site", "/" #redirect to main page of template localhost:3000
    end

#config.clear_sidebar_sections! #for disabling the sidebar including filters


   index  do
    column :productname
    column :description 
    #column :price
   column("Category"){|product| product.category.categoryname }#displaying categoryname related product

 column :image do |image|
      image_tag(image.avatar.url)
    end
column("status") { |product| status_tag (product.status ? "approved" : "Pending"),(product.status ? :ok : :error)} #checking wether prodcuct is approved or not

end



       form do |f|   #customizing the new product

f.inputs "select the category" do
f.collection_select :category_id, Category.all, :id, :categoryname
end

    f.inputs "products" do

      f.input :productname
      f.input :description
	f.input :price 
	  #f.input :created_at, :input_html => {:class => 'datepicker'} 

       f.input :avatar, :as => :file #for uploading the image
   
      f.input :status, :label => "product Status", :as => :check_boxes, :collection => ["approval","pending"]
end
    

    f.buttons

end

  filter :category, :as => :select, :collection => proc { Category.all }
  ActiveAdmin.register_page "My Page" do

    content do
      para "welcome to the additional page"
    end
  end
 
end
