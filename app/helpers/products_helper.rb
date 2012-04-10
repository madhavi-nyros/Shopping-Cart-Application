module ProductsHelper

def disp(y, z)
   x = (y.to_date - z.to_date).to_i
	if x>365
		b=x/365
		if b<=1
		return "#{b}year"
		else
		return "#{b}years"
		end
	else if x>30
		a=x/30
		return "#{a}months"
		else
		return "#{x}days"
	end
		
	end
	 
end

end
