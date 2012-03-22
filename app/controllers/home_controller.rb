class HomeController < ApplicationController
  def index
    @search = List.search(params[:search])
    @test = params[:search]
    @lists = @search.all
  end

  private 
  
  def get_variable
    @list = List.all
  end
end
