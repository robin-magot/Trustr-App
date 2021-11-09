require "open-uri"
require "nokogiri"
require "pry-byebug"
require "json"


  response = URI.open("https://fr.trustpilot.com/review/www.leslipfrancais.fr").read
  html_doc = Nokogiri::HTML(response)
  p html_doc.search(".styles_rating__1Xlha").text



#paragraph.children.text.gsub(" ", "").scan(/[0-9]{9}/).first
#utiliser open uri puis nikogiri, et utiliser le regex pour trouver le numéro, puis appeler l'API pappers. 
# itération + variable
 # On sait que sur la page, il y a toujours un mot de la liste
 # On chercher à récupérer le href qui mène à la page de la liste
 # Après avoir récupéré le href, on scrap la nouvelle page
 # On utilise les regex pour trouver siret et siren
 # On fetch l'API de pappers avec le numero SIREN trouvé pour récupérer les infos
 # Attention le .at renvoie une erreur s'il ne trouve pas le nom cherché dans la liste
 # Il faut faire une condition : if tatata containt, alors tatata contains récupère href
 # Passer une demie journée à chercher l'API
 # API solo, SCRAPER avec aide