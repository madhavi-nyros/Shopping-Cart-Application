module ApplicationHelper
:current_user
def resource_name
    :user
    
  end
 
  def resource
    @resource ||= User.new
    @resource ||= Category.new
  end
 
  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

   def find_user_name
     if user_signed_in?
        return user.user_name
     end
  end

end
