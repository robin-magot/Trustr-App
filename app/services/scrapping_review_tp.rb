class ScrappingReviewTp
  def initialize(url)
    @url = url
  end

  def scrapdeouf
    url_name = UrlHost.new(@url).call
    response = URI.open("https://fr.trustpilot.com/review/#{url_name}").read
    html_doc = Nokogiri::HTML(response)
    rating = html_doc.search(".styles_rating__1Xlha").text
    review_data = JSON.parse(html_doc.search("script").children.last.text)["props"]["pageProps"]["reviews"].map do |review|
      [review["title"], review["text"], review["dates"]["publishedDate"]]
    end
    { rating: rating, review_data: review_data }
  end
end

