require 'nokogiri'
require 'open-uri'


#1 get_the_email_of_a_townhal_from_its_webpage écris une méthode qui, récupère l'adresse email à partir de l'url de Vauréal
@doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/95/vaureal.html'))

def get_the_email_of_a_townhal_from_its_webpage(f)
    puts @doc.xpath(f)
end

get_the_email_of_a_townhal_from_its_webpage('///html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')



#2 get_all_the_urls_of_val_doise_townhalls
@page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))

def get_all_the_urls_of_val_doise_townhalls(t)
  puts @page.xpath(t)
end

get_all_the_urls_of_val_doise_townhalls("//a[@class = 'lientxt']/@href")



#3 on merge les 2 pour avoir toutes les adresses email des mairies du Val d'Oise

def get_all_the_name_and_mail_of_val_doise_townhalls
  array_city_name = []
  array_city_mail = []

  page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
  liens_pages = page.xpath("//a[@class = 'lientxt']/@href")

  #pour chaque lien de page, je récupère le nom de ville et le mail dans 2 tableaux
  liens_pages.each do |url_mairie|
    urls = Nokogiri::HTML(open("http://annuaire-des-mairies.com/#{url_mairie}"))
    array_city_name = urls.xpath('//body/div/main/section[1]/div/div/div/h1')
    array_city_mail = urls.xpath('//body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')

  #je compile les 2 dans un hash
  puts hash = array_city_name.zip(array_city_mail)
  end
end

  get_all_the_name_and_mail_of_val_doise_townhalls
