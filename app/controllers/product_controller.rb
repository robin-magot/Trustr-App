require "open-uri"
require "nokogiri"
require "pry-byebug"

LIST_PAGES = ["Mentions Légales", "CGV", "conditions générales de vente", "CGU", "à propos", "RCS"]
url = "https://www.respire.co/" #url = Product.find(params[:id])&.url
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

  #SIRET OBTENU