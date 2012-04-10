class Category < ActiveRecord::Base
has_many :products
 
include Tire::Model::Search
      include Tire::Model::Callbacks
categories = [
      { :id => '6', :type => 'category', :categoryname => "Laptops"},
      { :id => '7', :type => 'category', :categoryname => "Desktops"},
	{ :id => '8', :type => 'category', :categoryname => "Stored Devices"},
	{ :id => '9', :type => 'category', :categoryname => "Mouse&Keyborads"},
    ]


   Tire.index 'categories' do
      import categories
     

end
 	
end
