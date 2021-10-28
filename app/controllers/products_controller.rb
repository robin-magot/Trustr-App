class ProductsController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home
  def create
    user_url = params[:product][:url] 
    url = UrlSplit.new(user_url).call
    siren = ScrappingSiren.new(url).call
    score = ApiScore.new(siren).call
    product = Product.create(url: url, name: score[:name] )
    #créer les instances de score avec les différents indicateurs OK
    #indicateur ID / product ID indicator.all .each do indicator score hash crochet indicator, si la valeur est differente de nil alors . new
    # quand tout est finit, redirect to, product show. 
    #tout redirect vers la show de product
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