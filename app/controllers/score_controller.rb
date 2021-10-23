require "open-uri"
require "nokogiri"

def scrape_pappers_from_website(siret)
  # TODO: look for info based on SIRET.
  siret = 844520460
  url = "https://api.pappers.fr/v2/entreprise?api_token=#{ENV["PAPPERS_URL"]}&siren=#{siren}"
  response = URI.open(url).read
  html_doc = Nokogiri::HTML(response)
  html_doc.search('.infos-princi') each do |element|
    date = element.search('.info-right').text.strip #company creation date ?
    address = element.search('.info-left').text.strip # company address ?
    @pappers_info << { date: date, address: address}
  end
  return @pappers_info
end
#-----------------------------------------------------


#FETCHING API