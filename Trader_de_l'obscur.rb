require 'rubygems'
require 'nokogiri'
require 'open-uri'

def crypto (my_url)
        @page = Nokogiri::HTML(open("#{my_url}"))
        @new_email = @page.css('//*[@id="id-ethereum"]/td[5]/a')
    end
    def name_crypto
        @new_array = []
        @new_urls = []
        @page_2 = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
        @news_urls = @page_2.css("a").select{|link| link['class'] == "lientxt"}
        @array_of_urls = @news_urls.each{|link|@new_array << link["href"].gsub("./","https://coinmarketcap.com/all/views/all/") } #{}"#{@debut_url}#{link['href']}" }
    end

    def get_all_crypto
        @cours = []
        @i = 0
        while @i < @r
            @url = @new_array[@i]
            @cours << crypto(@url)
            @i = @i + 1
        end  
    end