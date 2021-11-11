class ScrappingSiren
  def initialize(url)
    @url = url
  end

  def call
    list_pages = ["Mentions légales","Mentions Légales", "CGV", "conditions générales de vente", "CGU", "à propos", "RCS"]
    url = @url #url = Product.find(params[:id])&.url
    response = URI.open(url).read
    html_doc = Nokogiri::HTML(response)
    url_to_scrap_for_siret = list_pages.map do |name| 
      element = html_doc.at("a:contains('#{name}')")
      element.attribute("href") unless element.nil?
    end.compact.first.value
    url_to_scrap_for_siret = "#{url}#{url_to_scrap_for_siret}" unless url_to_scrap_for_siret.start_with?("https")      
    response1 = URI.open(url_to_scrap_for_siret).read
    html_doc1 = Nokogiri::HTML(response1)
    paragraphs = html_doc1.search("p")
    siren = paragraphs.map do |paragraph| 
      paragraph.children.text.gsub(" ", "").scan(/[0-9]{9}/).first 
    end.compact
    p siren 
  end
end