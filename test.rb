require "open-uri"
require "nokogiri"
require "pry-byebug"

LIST_PAGES = ["Mentions Légales", "CGV", "conditions générales de vente", "CGU", "à propos", "RCS"]
url = "https://www.respire.co/" #gets.chomp
response = URI.open(url).read
html_doc = Nokogiri::HTML(response)
url_to_scrap_for_siret = LIST_PAGES.map do |name| 
    element = html_doc.at("a:contains('#{name}')")
    element.attribute("href") unless element.nil?
end.compact.first.value

  response1 = URI.open(url_to_scrap_for_siret).read
  html_doc1 = Nokogiri::HTML(response1)
  paragraphs = html_doc1.search("p")
  siren = paragraphs.map do |paragraph| 
    paragraph.children.text.gsub(" ", "").scan(/[0-9]{9}/).first 
  end.compact
  p siren


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