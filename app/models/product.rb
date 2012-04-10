class Product < ActiveRecord::Base
has_many :orders
belongs_to :user
 has_attached_file :avatar, :styles => {
                      :thumb => "120*90>",
                      :small => "120*90>"
                    }

belongs_to :category
scope :approved, where(:status => 1)

end
