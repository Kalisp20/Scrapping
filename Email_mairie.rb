require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_url

	@nom_mairie=[]
    @hypertext=[]
    @email=[]

	page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))   
	page.css("a.lientxt").each do |node|

		@hypertext << [(node['href'].slice!(1,1000))]  
		@nom_mairie << node.text
    end
	
    @hypertext.each do |route|
        puts "blabla#{route}"

        def get_the_email

	        page = Nokogiri::HTML(open("http://annuaire-des-mairies.com#{route}"))
            @email<< page.css('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
            
        end
    
    end

end

get_all_url




