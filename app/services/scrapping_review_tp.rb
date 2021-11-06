class ScrappingReviewTp
  def initialize(url)
    @url = url
  end

  def scrapdeouf
    url_name = UrlHost.new(@url).call
    response = URI.open("https://fr.trustpilot.com/review/#{url_name}").read
    html_doc = Nokogiri::HTML(response)
    rating = html_doc.search(".styles_rating__1Xlha").text
    reviews = JSON.parse(html_doc.search("script").children.last.text)["props"]["pageProps"]["reviews"].map do |review|
      review["text"]
    end
    { rating: rating, reviews: reviews }
  end
end

