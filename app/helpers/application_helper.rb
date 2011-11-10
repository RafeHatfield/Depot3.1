module ApplicationHelper
	def display_date
	  "#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}" 
	end
end
