ActiveAdmin.register Category do
 #menu :label => "My categories"
 #menu :parent => "List"
menu :label => "categories", :parent => "Dashboard" #here the default parent is dashboard inthat you can see submenu as categories like wise you can add any controller as parent dashboard
class Category    
index do
 
column :categoryname

end
  def to_s
    categoryname
  end
end
  
end
