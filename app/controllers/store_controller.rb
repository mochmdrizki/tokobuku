class StoreController < ApplicationController  
  def index
    if params[:search]
      @books = Book.search(params[:search]).order('created_at DESC')
    else
      @books = Book.order('created_at DESC')
    end
  end
end
