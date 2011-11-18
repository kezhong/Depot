class StoreController < ApplicationController
  def index
    @products = Product.all
  end
  
  def books
    @products = Product.books
  end
  
  def movies
    @products = Product.movies
  end
  
  def music
    @products = Product.music    
  end

end
