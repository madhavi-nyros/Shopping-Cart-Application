class OrdersController < ApplicationController
include ActiveMerchant::Billing::Integrations

  def new
    @order = Order.new(:express_token => params[:token])

  end

  def create

   @order = Order.new(params[:order])
    @order.ip_address = request.remote_ip
    
      if @order.purchase
	
         render :text => "success"

	 @order.save
      else
         render :text => "failure"
      end
    
  end

  def express

  amount = 1000  

  response = EXPRESS_GATEWAY.setup_purchase(amount,
    :ip                => request.remote_ip,
    :return_url        => confirm_orders_url,
    :cancel_return_url => products_url

  )

 
  redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token)



  
  # The card verification value is also known as CVV2, CVC2, or CID 
   credit_card = ActiveMerchant::Billing::CreditCard.new(
                :type               => params[:card_type],
                :first_name         => params[:first_name],
                :last_name          => params[:last_name],
                :number             => params[:card_number],
                :month              => params[:month],
                :year               => params[:year],
                :verification_value => params[:verify]
              )

  end




  def confirm
      @order = Order.new
  end



end
