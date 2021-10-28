require 'uri'

class UrlSplit
  def initialize(url)
    @url = url
  end

  def call 
    uri = URI(@url)
    return uri.scheme + "://" + uri.host
  end
end