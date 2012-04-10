class ApplicationController < ActionController::Base
  protect_from_forgery
 include ProductsHelper
def index
    @products = Product.all
@products = Product.order("name").page(params[:page]).per(4)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

def index
@categories = Category.all
end

def new
@category = Category.new
end
#def after_sign_in_path_for(resource)
   #redirect_to new_category_path # <- Path you want to redirect the user to.
  #end
helper_method :current_user, :current_account, :logged_in?
	


end
