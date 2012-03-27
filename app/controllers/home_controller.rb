class HomeController < ApplicationController
  def index
    @title = "Home"
    @search = List.search(params[:search])
    @test = params[:search]
    @lists = @search.all
  end

  def about
    @title = "About"
    @search = List.search(params[:search])
    @test = params[:search]
    @lists = @search.all
  end
  
  
end
