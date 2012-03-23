class HomeController < ApplicationController
  def index
    @search = List.search(params[:search])
    @test = params[:search]
    @lists = @search.all
  end

  def about
    @search = List.search(params[:search])
    @test = params[:search]
    @lists = @search.all
  end
  
  
end
