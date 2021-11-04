class ScrappingReviewTp
  def initialize(url)
    @url = url
  end

  def scrapdeouf
    url_name = UrlHost.new(@url).call
    response = URI.open("https://fr.trustpilot.com/review/#{url_name}").read
    html_doc = Nokogiri::HTML(response)
    html_doc.search(".styles_rating__1Xlha").text
  end
end

