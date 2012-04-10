class Order < ActiveRecord::Base
belongs_to :product
def express_purchase_options
  {
    :ip => '127.0.0.1',
    :token => express_token,
    :payer_id => express_payer_id
  }
  end

  def standard_purchase_options
  {
    :ip => '127.0.0.1',
    :billing_address => {
      :name     => "Ryan Bates",
      :address1 => "123 Main St.",
      :city     => "New York",
      :state    => "NY",
      :country  => "US",
      :zip      => "10001"
    }
  }
  end

  def purchase
   response = process_purchase
   puts response.inspect
return response
  end


  def process_purchase

    EXPRESS_GATEWAY.purchase(1000, express_purchase_options)
 
end

end
