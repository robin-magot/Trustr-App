require "open-uri"
require "nokogiri"

def scrape_pappers_from_website(siret)
  # TODO: look for info based on SIRET.
  siret = 844520460
  url = "https://www.pappers.fr/entreprise/#{siret}"
  response = URI.open(url).read
  html_doc = Nokogiri::HTML(response)
  @pappers_info = [] # Goes to the first category
  html_doc.search('.infos-princi') each do |element|
    date = element.search('.info-right').text.strip #company creation date ?
    address = element.search('.info-left').text.strip # company address ?
    @pappers_info << { date: date, address: address}
  end
  return @pappers_info
end

#-----------------------------------------------------


#FETCHING API