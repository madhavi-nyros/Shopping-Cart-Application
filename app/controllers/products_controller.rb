require 'rubygems'
require 'active_merchant'
class ProductsController < ApplicationController
helper_method :current_user
  # GET /products
  # GET /products.json
  def index
  if current_user.blank?
   @products = Product.all
   #@products.each do |p|
  # x = (p.expires_on.to_date - p.created_at.to_date).to_i
	#puts "###################################"
	#puts x
	#puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
   #end

else

	  @products = Product.find(:all, :conditions => {:user_id => current_user.id} )

  end

#@x=@product.expires_on-@product.created_at

	@categories=Category.all

 # @products = Product.paginate(:per_page => 4, :page => params[:page])
  sleep 2
	
     respond_to do |format|
     format.html # index.html.erb
      format.json { render json: @products }
	format.js
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
#@product=@category.product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
   # @product = Product.new
#@category = Category.new
@categories=Category.all


@category = Category.find(params[:id])

@product = @category.products.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    #@product = Product.new(params[:product])
@category=Category.find(params[:id])
@product=@category.products.build(params[:product])
@product.user_id = self.current_user.id
    respond_to do |format|
      if @product.save
        #redirect_to new_product_path(:id => @category.id)
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
