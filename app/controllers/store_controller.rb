class StoreController < ApplicationController
  def index
    @products = Product.all
    @cart = current_cart
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
  
  def search
    
  end
  
  def find_products
    @category = params[:category]
    @title = params[:keywords]
    if @category == "All"
      @products = Product.where("title LIKE ?","%#{@title}%")
    else
      @products = Product.where("title LIKE ? AND category = ?" , "%#{@title}%", @category)

    end
  end

end
