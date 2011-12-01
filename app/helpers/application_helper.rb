module ApplicationHelper
	def display_date
	  "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}" 
	end
	
	def hidden_div_if(condition, attributes = {}, &block)
		if condition
			attributes["style"] = "display: none"
		end
		content_tag("div", attributes, &block)
	end
	
end
