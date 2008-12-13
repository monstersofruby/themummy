class Links < Application
  
  # GET /links
  def index
    @links = Link.all
    render
  end

  # GET /links/:id
  def show
    @link = Link.find params[:id]
  end

  # GET /links/new
  def new
    @link = Link.new
    render
  end

  # POST /links
  def create
    @link = Link.new(:title => params[:title], :url => params[:url], :description => params[:description])
    render
  end

end
