class FacadesController < ApplicationController
  before_action :set_facade, only: [:show, :edit, :update, :destroy]

  # GET /facades
  # GET /facades.json
  def index
    @facades = Facade.all
  end

  # GET /facades/1
  # GET /facades/1.json
  def show
  end

  # GET /facades/new
  def new
    @facade = Facade.new
  end

  # GET /facades/1/edit
  def edit
  end

  # POST /facades
  # POST /facades.json
  def create
    @facade = Facade.new(facade_params)

    respond_to do |format|
      if @facade.save
        format.html { redirect_to @facade, notice: 'Facade was successfully created.' }
        format.json { render :show, status: :created, location: @facade }
      else
        format.html { render :new }
        format.json { render json: @facade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facades/1
  # PATCH/PUT /facades/1.json
  def update
    respond_to do |format|
      if @facade.update(facade_params)
        format.html { redirect_to @facade, notice: 'Facade was successfully updated.' }
        format.json { render :show, status: :ok, location: @facade }
      else
        format.html { render :edit }
        format.json { render json: @facade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facades/1
  # DELETE /facades/1.json
  def destroy
    @facade.destroy
    respond_to do |format|
      format.html { redirect_to facades_url, notice: 'Facade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facade
      @facade = Facade.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def facade_params
      params.require(:facade).permit(:name)
    end
end
