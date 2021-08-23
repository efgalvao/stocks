class QuotesController < ApplicationController
  before_action :set_quote, only: %i[show edit update destroy]

  # GET /quotes
  # GET /quotes.json
  def index
    @stocks = Stock.includes(:quotes).all
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show; end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit; end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)
    quantity = params[:quantity].to_i - 1
    respond_to do |format|
      if @quote.save
        Quote.transaction do
          quantity.times { Quote.create(quote_params) }
        end
        format.html { redirect_to quotes_path, notice: 'Quote was successfully created.' }
        format.json { render :show, status: :created, location: @quote }
      else
        format.html { render :new }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to stock_quote_path, notice: 'Quote was successfully updated.' }
        format.json { render :show, status: :ok, location: @quote }
      else
        format.html { render :edit }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: 'Quote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_quote
    @quote = Quote.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quote_params
    params.require(:quote).permit(:aquisition_date, :aquisition_value, :stock_id, :quantity)
  end
end
