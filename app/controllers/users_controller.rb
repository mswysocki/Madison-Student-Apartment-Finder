class UsersController < ApplicationController
  before_filter :authenticate, :only => [:index, :edit, :update, :destroy]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy
  
  helper_method :sort_column, :sort_direction
  
  def new
    @user = User.new
    @title = "Sign up"
  end
  
  def index
    @title = "All users"
    @users = User.paginate(:page => params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    @title = @user.Name
  end
  
  def admin
    @title = "Admin"
    @users = User.admin_user_search(params[:admin_us]).paginate(:page => params[:users_page], :per_page => 20)
    @lists = List.admin_list_search(params[:admin_ls]).order(sort_column + " " + sort_direction).paginate(:page => params[:lists_page], :per_page => 5)
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Madison Student Housing Finder!"
      redirect_to @user
    else
      @title = "Sign up"
      render 'new'
    end
  end
  
  def edit
    @title = "Edit user"
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = "Profile updated."
      redirect_to @user
    else 
      @title = "Edit user"
      render 'edit'
    end
  end
  
  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end
  
  private
  
    def authenticate
      deny_access unless signed_in?
    end
    
    def correct_user
      @user = User.find(params[:id])
      #puts; puts; puts; puts @user; puts; puts; puts;
      redirect_to(home_page_path) unless current_user?(@user)
    end
    
    def admin_user
      redirect_to(home_page_path) unless (signed_in? && current_user.admin?)
    end
    
    def sort_column
      %w[id Address Flags].include?(params[:sort]) ? params[:sort] : "Flags"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc" 
    end
      

end
