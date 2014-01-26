class PassesController < ApplicationController
  before_action :set_pass, only: [:show, :edit, :update, :destroy]
  before_action :can_has_admin?

  # GET /passes
  # GET /passes.json
  def index
    @passes = Pass.all
  end

  # GET /passes/1
  # GET /passes/1.json
  def show
  end

  # GET /passes/new
  def new
    @pass = Pass.new
  end

  # GET /passes/1/edit
  def edit
  end

  # POST /passes
  # POST /passes.json
  def create
    @pass = Pass.new(pass_params)

    respond_to do |format|
      if @pass.save
        format.html { redirect_to @pass, notice: 'Pass was successfully created.' }
        format.json { render action: 'show', status: :created, location: @pass }
      else
        format.html { render action: 'new' }
        format.json { render json: @pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /passes/1
  # PATCH/PUT /passes/1.json
  def update
    respond_to do |format|
      if @pass.update(pass_params)
        format.html { redirect_to @pass, notice: 'Pass was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @pass.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /passes/1
  # DELETE /passes/1.json
  def destroy
    @pass.destroy
    respond_to do |format|
      format.html { redirect_to passes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pass
      @pass = Pass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pass_params
      params.require(:pass).permit(:risetime, :duration, :user_id)
    end
end
