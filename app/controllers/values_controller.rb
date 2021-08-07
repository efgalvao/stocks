class ValuesController < ApplicationController
  before_action :set_value, only: %i[show edit update destroy]

  # GET /values
  # GET /values.json
  def index
    @values = Value.includes(:stock).all
  end

  # GET /values/1
  # GET /values/1.json
  def show
    @value = Value.find(params[:id])
  end

  # GET /values/new
  def new
    @value = Value.new
  end

  # GET /values/1/edit
  def edit
  end

  # POST /values
  # POST /values.json
  def create
    @value = Value.new(value_params)

    respond_to do |format|
      if @value.save
        format.html { redirect_to values_path, notice: 'Value was successfully created.' }
        format.json { render :show, status: :created, location: @value }
      else
        format.html { render :new }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /values/1
  # PATCH/PUT /values/1.json
  def update
    respond_to do |format|
      if @value.update(value_params)
        format.html do
          redirect_to value_path(@value), notice: 'Value was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @value }
      else
        format.html { render :edit }
        format.json { render json: @value.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /values/1
  # DELETE /values/1.json
  def destroy
    @value.destroy
    respond_to do |format|
      format.html do
        redirect_to values_path, notice: 'Value was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_value
    @value = Value.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def value_params
    params.require(:value).permit(:date, :value, :stock_id)
  end
end
