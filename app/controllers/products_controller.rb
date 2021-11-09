class ProductsController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home
  def create
    user_url = params[:product][:url] 
    reviews_scrapping = ScrappingReviewTp.new(user_url).scrapdeouf
    rating = reviews_scrapping[:rating]
    review_data = reviews_scrapping[:review_data]
    url = UrlSplit.new(user_url).call
    siren = ScrappingSiren.new(url).call
    papper_data = ApiScore.new(siren).call
    product = Product.create(user: current_user, rating: rating, url: url, name: papper_data[:nom])
    review_data.each do |title, description, created_date|
      Review.create(title: title, description: description, date: created_date, product: product)
    end

    # créer les instances de score avec les différents indicateurs OK
    # indicateur ID / product ID indicator.all .each do indicator score hash crochet indicator, si la valeur est differente de nil alors . new 
    papper_data.each do |title, content|
      indicator = Indicator.create(title: title, content: content)
      score = Score.create(product: product, indicator: indicator)
    end
    # quand tout est finit, redirect to, product show. 
    #tout redirect vers la show de product
    redirect_to product_path(product)
  end
  def show
    @product = Product.find (params[:id])
  end
end


# todo list 26/10
# mettre en place le hash, et tester
# mettre une seed sur les indicateurs pour test. 

# todo list 28/10
# créer la regex pour isoler le nom de domaine : 
# -> ^(?:http:\/\/|www\.|https:\/\/)([^\/]+)
# -> function get_domain_from_url(url) {
# activer l'input search url
# créer le create product controller
# relier la view
