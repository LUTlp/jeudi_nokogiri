require 'nokogiri'
require 'open-uri'

doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

#fait un programme qui va récupérer le cours de toutes les cryptomonnaies,
# et les enregistrer bien proprement dans une array de hashs pour 1h, 24h, 7j
# un hash par monnaie = {1h => X , 24h => y, 7j => z}
def hash_creation
  #hashes_cryptomonnaie = (name => A, 1h_value => B, 24h_value => C, 7d_value => D)

  entree_cryptomonnaie = doc.xpath('//body/div[2]/div/div[1]/div[3]/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/a')

  #pour chaque lien de page, je récupère le nom de ville et le mail dans 2 tableaux
  entree_cryptomonnaie.each do |cryptomonnaie|

hashes_cryptomonnaie = {}
hashes_cryptomonnaie{:name} = doc.xpath('//body/div[2]/div/div[1]/div[3]/div[3]/div[2]/div/table/tbody/tr[1]/td[2]/a')
hashes_cryptomonnaie{:"1h_value"} = doc.xpath('//body/div[2]/div/div[1]/div[3]/div[3]/div[2]/div/table/tbody/tr[1]/td[8]')
hashes_cryptomonnaie{:"24h_value"} = doc.xpath('//body/div[2]/div/div[1]/div[3]/div[3]/div[2]/div/table/tbody/tr[1]/td[9]')
hashes_cryptomonnaie{:"7d_value"} = doc.xpath('//body/div[2]/div/div[1]/div[3]/div[3]/div[2]/div/table/tbody/tr[1]/td[10]')
end



# création du tableau
array = []
array.push(hashes_cryptomonnaie)


end
