require "open-uri"
require "nokogiri"

LIST_PAGES = ["mentions légales", "CGV", "conditions générales de vente", "CGU", "à propos", "RCS"]
url = "https://www.respire.co/"
response = URI.open(url).read
html_doc = Nokogiri::HTML(response)
website_siret = [] # Goes to the list of pages that might contain siret
  puts html_doc.at("a:contains('CGV')").attribute("href")#("a").text_includes(name)# each do |element| 
   # name_url = element.href
    #puts name_url
 # end


 # On sait que sur la page, il y a toujours un mot de la liste
 # On chercher à récupérer le href qui mène à la page de la liste
 # Après avoir récupéré le href, on scrap la nouvelle page
 # On utilise les regex pour trouver siret et siren
 # On fetch l'API de pappers avec le numero SIREN trouvé pour récupérer les infos
 # Attention le .at renvoie une erreur s'il ne trouve pas le nom cherché dans la liste
 # Il faut faire une condition : if tatata containt, alors tatata contains récupère href
 # Passer une demie journée à chercher l'API
 # API solo, SCRAPER avec aide