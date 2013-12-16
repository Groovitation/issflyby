class SpacepeopleController < ApplicationController
  before_action :set_spaceperson, only: [:show, :edit, :update, :destroy]

  # GET /spacepeople
  # GET /spacepeople.json
  def index
    @spacepeople = Spaceperson.all
  end

  # GET /spacepeople/1
  # GET /spacepeople/1.json
  def show
  end

  # GET /spacepeople/new
  def new
    @spaceperson = Spaceperson.new
  end

  # GET /spacepeople/1/edit
  def edit
  end

  # POST /spacepeople
  # POST /spacepeople.json
  def create
    @spaceperson = Spaceperson.new(spaceperson_params)

    respond_to do |format|
      if @spaceperson.save
        format.html { redirect_to @spaceperson, notice: 'Spaceperson was successfully created.' }
        format.json { render action: 'show', status: :created, location: @spaceperson }
      else
        format.html { render action: 'new' }
        format.json { render json: @spaceperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spacepeople/1
  # PATCH/PUT /spacepeople/1.json
  def update
    respond_to do |format|
      if @spaceperson.update(spaceperson_params)
        format.html { redirect_to @spaceperson, notice: 'Spaceperson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @spaceperson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spacepeople/1
  # DELETE /spacepeople/1.json
  def destroy
    @spaceperson.destroy
    respond_to do |format|
      format.html { redirect_to spacepeople_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spaceperson
      @spaceperson = Spaceperson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def spaceperson_params
      params.require(:spaceperson).permit(:name, :craft, :Spacecraft_id)
    end
end
