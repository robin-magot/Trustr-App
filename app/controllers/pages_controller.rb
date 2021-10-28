class PagesController < ApplicationController
  #skip_before_action :authenticate_user!, only: :home
  def home
    @product = Product.new
  end
end



# input simple form -> product controller #create
# url -> product -> product.new 
