require 'rubygems'
require 'nokogiri'
require 'open-uri'
def recup_omc
	
	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr/deputes/liste/alphabetique")) 
	
	doc.css('//*[@id="deputes-list"]/div/ul/li/a').each do |node|
	@dep_prenoms = node.text.sub("M.","").sub("Mme","").split(' ').slice(0)
	@dep_noms = node.text.sub("M.","").sub("Mme","").split(' ').slice(1..3)
	@OMC = node['href']
	recup_mail(@OMC)
	end
end


def recup_mail(x)



	array_prenom_noms = []
	dep_noms_array = []
	dep_prenoms_array = []
	@emails = []

	#4 array vides

	doc = Nokogiri::HTML(open("http://www2.assemblee-nationale.fr"+x))
	doc.xpath('//*[@id="haut-contenu-page"]/article/div[3]/div/dl/dd[4]/ul/li[1]/a').each do |node|
	@emails << node['href'].sub("mailto:","")
	dep_noms_array << @dep_noms
	dep_prenoms_array << @dep_prenoms
	array_prenom_noms << dep_noms_array.flatten + dep_prenoms_array

	end

puts Hash[array_prenom_noms.zip(@emails)]

end

recup_omc

