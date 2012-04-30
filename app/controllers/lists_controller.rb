class ListsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /lists
  # GET /lists.xml
  def index
    @title = "Search Results"
    
    @test = params[:search]   #used for hiding of results, if there are none.
    unless (@test.nil?)
      addr = @test["address_contains"]
      @test["address_contains"] = List.street_endings(addr)
    end
    
    @search = List.search(params[:search]).paginate(:page => params[:results_page], :per_page => 5)
    puts "TESTING"; puts params[:search]
    
    @lists = @search.all
    @no_results = List.no_results(@lists)    
   
    #reset the search parameter
    @search = List.search(params[:search]);
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @review = Review.new if signed_in?
    @search = List.search(params[:search])
    @test = params[:search]   #used for hiding
    @lists = @search.all
    
    @list = List.find(params[:id]) 
    #current_listing = set_listing(@list)
    @reviews = @list.reviews.paginate(:page => params[:page])
    @title = title_helper(@list)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list }
    end
    

  end

  # GET /lists/new
  # GET /lists/new.xml
  def new
    @title = "New Listing"
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @title = "Update Listing"
    @list = List.find(params[:id])
  end

  # POST /lists
  # POST /lists.xml
  def create
    params[:list]["address"] = List.format_address! params[:list]
    @list = List.new(params[:list])
    
    respond_to do |format|
      if (recaptcha_valid? && @list.valid?)
        @list.save
        format.html { redirect_to(@list, :notice => 'List was successfully created.') }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        captcha_error = { :Incorrect=>["captcha input"] }
        
        List.transaction do
          @title = "New Listing"
          if (!@list.valid? && recaptcha_valid?)
            format.html { render :action => "new" }
            format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }   
          else 
            @list.errors.merge!(captcha_error) 
            format.html { render :action => "new" }
            format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
          end
        end
        
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    unless params[:list]["address"].nil? 
      params[:list]["address"] = List.format_address! params[:list]      
    end
    
    
    @list = List.find(params[:id])
    respond_to do |format|
      if (recaptcha_valid? && @list.valid?)
        @list.update_attributes(params[:list])
        format.html { redirect_to(@list, :notice => 'List was successfully updated.') }
        format.xml  { head :ok }
      else
        captcha_error = { :Incorrect => ["captcha input"] }
        List.transaction do
          @title = "Update Listing"
          if (!@list.valid? && recaptcha_valid?)
            #do nothing, just changed
          else 
            @list.errors.merge!(captcha_error) 
          end
        end
        
        format.html { render :action => "edit" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }   
        
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.xml
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
      format.xml  { head :ok }
    end
  end
 
 
 
 
  private
  
  def title_helper(list)
    if list.ltype
      return list.address
    else 
      return "#{@list.aptnum} #{@list.building_name}"
    end
  end
  
  def get_landlord_name(landlord_id)
    return Landlord.find(landlord_id).name
  end
 
end
