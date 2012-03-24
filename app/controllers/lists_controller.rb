class ListsController < ApplicationController
  helper_method :sort_column, :sort_direction
  # GET /lists
  # GET /lists.xml
  def index
    #@lists = List.all
    @test = params[:search]   #used for hiding
    #puts @test
    unless (@test.nil?)
      addr = @test["Address_contains"]
      @test["Address_contains"] = List.street_endings(addr)
    end
    @search = List.search(params[:search])

    @lists = @search.all
    
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

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @list }
    end
    @title = @list.Address
  end

  # GET /lists/new
  # GET /lists/new.xml
  # This works along with the create() method below.  This method launches a 
  # page (new.html) that works as a form for the creation of a Listing.
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list }
    end
  end

  # GET /lists/1/edit
  def edit
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
    @list = List.new(params[:list])

    respond_to do |format|
      if @list.save
        format.html { redirect_to(@list, :notice => 'List was successfully created.') }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    
    
    
    #below is what we want for adminUpdate - free access
    @list = List.find(params[:id])

    respond_to do |format|
      if @list.update_attributes(params[:list])
        format.html { redirect_to(@list, :notice => 'List was successfully updated.') }
        format.xml  { head :ok }
      else
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
