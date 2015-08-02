module ApplicationHelper
	def md(string)
    RDiscount.new(string).to_html.html_safe
 	end
end
