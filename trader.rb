require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_crypto
    
    @names_crypto=[]
    @price=[]
    
    page = Nokogiri::HTML(open("https://coinmarketcap.com"))
    page.css("a.price").each do |node|
        @price<< node.text
    end
    
    page = Nokogiri::HTML(open("https://coinmarketcap.com"))
    page.css("a.currency-name-container").each do |currency|
        @names_crypto << currency.text
    end

end

get_crypto

puts Hash[@names_crypto.zip(@price)]
