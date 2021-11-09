class ScrappingReviewTp
  def initialize(url)
    @url = url
  end

  def url_valid?(url)
    valid_url = URI.parse("https://fr.trustpilot.com/review/#{url}")
    req = Net::HTTP.new(valid_url.host, valid_url.port)
    req.use_ssl = true
    res = req.request_head(valid_url.path)
    res.code == "200"
  end

  def scrapdeouf
    url_name = UrlHost.new(@url).call
    if url_valid?(url_name)
      response = URI.open("https://fr.trustpilot.com/review/#{url_name}").read
      html_doc = Nokogiri::HTML(response)
      rating = html_doc.search(".styles_rating__1Xlha").text
      review_data = JSON.parse(html_doc.search("script").children.last.text)["props"]["pageProps"]["reviews"].map do |review|
        [review["title"], review["text"], review["dates"]["publishedDate"]]
      end
      { rating: rating, review_data: review_data }
    else 
      { rating: nil, review_data: nil }
    end
  end
end

