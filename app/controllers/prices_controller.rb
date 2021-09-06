class PricesController < ApplicationController
  before_action :set_price, only: %i[show edit update destroy]

  # GET /prices
  # GET /prices.json
  def index
    @prices = Price.includes(:stock).all
  end

  # GET /prices/1
  # GET /prices/1.json
  def show; end

  # GET /prices/new
  def new
    @price = Price.new
  end

  # GET /prices/1/edit
  def edit; end

  # POST /prices
  # POST /prices.json
  def create
    @price = Price.new(price_params)

    respond_to do |format|
      if @price.save
        format.html { redirect_to prices_path, notice: 'Price was successfully created.' }
        format.json { render :show, status: :created, location: @price }
      else
        format.html { render :new }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prices/1
  # PATCH/PUT /prices/1.json
  def update
    respond_to do |format|
      if @price.update(price_params)
        format.html do
          redirect_to price_path(@price), notice: 'Price was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @price }
      else
        format.html { render :edit }
        format.json { render json: @price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prices/1
  # DELETE /prices/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html do
        redirect_to prices_path, notice: 'Price was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = Price.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def price_params
    params.require(:price).permit(:date, :price, :stock_id)
  end
end
