class WatersController < ApplicationController
  before_action :set_water, only: [:show, :edit, :update, :destroy]

  # GET /waters
  # GET /waters.json
  def index
    @waters = Water.all
  end

  # GET /waters/1
  # GET /waters/1.json
  def show
    @water = Water.find(params[:id])
    Resque.enqueue(EmsShow, @water.id)
    #@result = HTTParty.post('http://131.181.156.32/Ion/default.aspx/GetRTxmlData'.to_str, :body => { :dgm => @water.dgm, :id => '', :node => @water.node}.to_json, :headers => {'Content-Type' => 'application/json' } )["d"]
    render :xml => @water.usage
    #@xively = HTTParty.get('https://api.xively.com/v2/feeds/350817357.json?datastreams=shake,x', :headers => {'X-ApiKEY' => 'H3zbRxjJkW85pcKoWzzFYP3jVy6FIfzZvr0liLD12FIaO81H'} )
    #@xively = HTTParty.get('https://api.xively.com/v2/feeds/350817357', :headers => {'X-ApiKEY' => 'H3zbRxjJkW85pcKoWzzFYP3jVy6FIfzZvr0liLD12FIaO81H'} )
    #render :xml => @xively
    #@result = RestClient.post 'http://131.181.156.32/Ion/default.aspx/GetRTxmlData', { 'dgm' => @water.dgm, 'id' => '', 'node' => @water.node}.to_json, :content_type => :json, :accept => :json
#   @resultHash = Hash.from_xml(@result)["DiagramInput"]
  end

  # GET /waters/new
  def new
    @water = Water.new
  end

  # GET /waters/1/edit
  def edit
  end

  # POST /waters
  # POST /waters.json
  def create
    @water = Water.new(water_params)
    
    respond_to do |format|
      if @water.save
        Resque.enqueue(EmsShow, @water.id)
        format.html { redirect_to @water, notice: 'Water was successfully created.' }
        format.json { render :show, status: :created, location: @water }
      else
        format.html { render :new }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /waters/1
  # PATCH/PUT /waters/1.json
  def update
    respond_to do |format|
      if @water.update(water_params)
        format.html { redirect_to @water, notice: 'Water was successfully updated.' }
        format.json { render :show, status: :ok, location: @water }
      else
        format.html { render :edit }
        format.json { render json: @water.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /waters/1
  # DELETE /waters/1.json
  def destroy
    @water.destroy
    respond_to do |format|
      format.html { redirect_to waters_url, notice: 'Water was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water
      @water = Water.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_params
      params.require(:water).permit(:dgm, :node)
    end
end
