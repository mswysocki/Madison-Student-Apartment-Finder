class ListsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /lists
  # GET /lists.xml
  def index
    @title = "Search Results"
    #@lists = List.all
    @test = params[:search]   #used for hiding
    #puts @test
    unless (@test.nil?)
      addr = @test["Address_contains"]
      @test["Address_contains"] = List.street_endings(addr)
    end
    @search = List.search(params[:search])

    @lists = @search.all
    #@lists = List.paginate(:page => params[:page], :per_page => 5)
    @no_results = List.no_results(@lists)    
    #@lists = List.all
    #@lists = List.order(sort_column + " " + sort_direction).paginate(:per_page => 5)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @search = List.search(params[:search])
    @test = params[:search]   #used for hiding
    @lists = @search.all
    
    @list = List.find(params[:id])
    @title = @list.Address

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list }
    end

  end

  # GET /lists/new
  # GET /lists/new.xml
  # This works along with the create() method below.  This method launches a 
  # page (new.html) that works as a form for the creation of a Listing.
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
  # Works as the create() method from the spec.  Creates a new Listing object 
  # given the input from the form (on listing/new.html) 
  # Auto-checks a variety of things, including making sure zip code, address,
  # rent, and number of rooms are all valid.
  # Default values for City => "Madison" and State => "Wisconsin"
  def create
    params[:list]["Address"] = List.format_address! params[:list]
    @list = List.new(params[:list])
    respond_to do |format|
      if (recaptcha_valid? && @list.valid?)
        @list.save
        format.html { redirect_to(@list, :notice => 'List was successfully created.') }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        captcha_error = { :Incorrect=>["captcha input"] }
        
        List.transaction do
          if (!@list.valid? && recaptcha_valid?)
            @title = "New Listing"
            format.html { render :action => "new" }
            format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }   
          else 
            @title = "New Listing"
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
    params[:list]["Address"] = List.format_address! params[:list]
    
    
    #below is what we want for adminUpdate - free access
    #restrictions will be mostly on the view side with erb
    
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(@list, :notice => 'List was successfully updated.') }
        format.xml  { head :ok }
      else
        @title = "Update Listing"
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
  
 
end
