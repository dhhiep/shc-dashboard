class CentralsController < ApplicationController
  before_action :set_central, only: [:show, :edit, :update, :destroy]

  # GET /centrals
  # GET /centrals.json
  def index
    @centrals = Central.all
  end

  # GET /centrals/1
  # GET /centrals/1.json
  def show
  end

  # GET /centrals/new
  def new
    @central = Central.new
  end

  # GET /centrals/1/edit
  def edit
  end

  # POST /centrals
  # POST /centrals.json
  def create
    @central = Central.new(central_params)

    respond_to do |format|
      if @central.save
        format.html { redirect_to @central, notice: 'Central was successfully created.' }
        format.json { render :show, status: :created, location: @central }
      else
        format.html { render :new }
        format.json { render json: @central.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /centrals/1
  # PATCH/PUT /centrals/1.json
  def update
    respond_to do |format|
      if @central.update(central_params)
        format.html { redirect_to @central, notice: 'Central was successfully updated.' }
        format.json { render :show, status: :ok, location: @central }
      else
        format.html { render :edit }
        format.json { render json: @central.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /centrals/1
  # DELETE /centrals/1.json
  def destroy
    @central.destroy
    respond_to do |format|
      format.html { redirect_to centrals_url, notice: 'Central was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def status
    @central = Central.find_by_key(params[:key])
    if @central
      render plain: @central.value, :status => 200, :layouts => false
    else
      render text: 'Not found!', :status => 200
    end
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_central
      @central = Central.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def central_params
      params.require(:central).permit(:key, :value, :description)
    end
end
