require "open-uri"
require "nokogiri"

def scrape_siret_from_website
  # TODO: look for SIRET number based on URL.
  LIST_PAGES = ["mentions légales", "CGV", "conditions générales de vente", "CGU", "à propos", "RCS"]
  url = Product.find(params[:id])&.url
  response = URI.open(url).read
  html_doc = Nokogiri::HTML(response)
  website_siret = [] # Goes to the list of pages that might contain siret
  LIST_PAGES.each do |name|
    html_doc.search("a").text_includes(name) each do |element| 
      name_url = element.href
      siren = element.search('').text.strip
      siret = element.search('').text.strip 
      address = element.search('').text.strip 
      website_siret << {siret: siret, siren: siren, address: address}
    end
  end
  return website_siret
end

#regex : ^[0-9]{9}$ SIRET
#regex : ^[0-9]{14}$ SIREN