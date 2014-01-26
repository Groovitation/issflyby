class SpacecraftsController < ApplicationController
  before_action :set_spacecraft, only: [:show, :edit, :update, :destroy]
  before_action :can_has_admin?, except: :show

  # GET /spacecrafts
  # GET /spacecrafts.json
  def index
    @spacecrafts = Spacecraft.all
  end

  # GET /spacecrafts/1
  # GET /spacecrafts/1.json
  def show
  end

  # GET /spacecrafts/new
  def new
    @spacecraft = Spacecraft.new
  end

  # GET /spacecrafts/1/edit
  def edit
  end

  # POST /spacecrafts
  # POST /spacecrafts.json
  def create
    @spacecraft = Spacecraft.new(spacecraft_params)

    respond_to do |format|
      if @spacecraft.save
        format.html { redirect_to @spacecraft, notice: 'Spacecraft was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spacecraft }
      else
        format.html { render action: 'new' }
        format.json { render json: @spacecraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spacecrafts/1
  # PATCH/PUT /spacecrafts/1.json
  def update
    respond_to do |format|
      if @spacecraft.update(spacecraft_params)
        format.html { redirect_to @spacecraft, notice: 'Spacecraft was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spacecraft.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spacecrafts/1
  # DELETE /spacecrafts/1.json
  def destroy
    @spacecraft.destroy
    respond_to do |format|
      format.html { redirect_to spacecrafts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spacecraft
      @spacecraft = Spacecraft.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spacecraft_params
      params.require(:spacecraft).permit(:name, :crew, :lat, :long)
    end
end
