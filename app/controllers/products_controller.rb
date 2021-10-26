class ProductsController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home
  def create
    #aller à la souche d'url pour la mettre dans l'url du product
    #name = url raccourcie (regex)
    #faire un appel au scrapping siren (siren = ScrappingSiren.new(name).call)
    #faire appel à API score = (score = ApiScore.new(siren).call)
    #créer les instances de score avec les différents indicateurs
    #indicateur ID / product ID
    #tout redirect vers la show de product

    #la grosse def create qui gère tout ;)

    #26/10 : mettre en place le hash, et tester. Mettre une seed sur les indicateurs pour test. 
  end
end