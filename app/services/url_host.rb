require 'uri'

class UrlHost
  def initialize(url)
    @url = url
  end

  def call 
    uri = URI(@url)
    uri.host
  end
end