class ChartsController < ApplicationController
  def index
    @facades = Facade.all
  end

  def average(acc)
    @valores = {}
    @valores[:name] = acc
    @valores[:aquisition] = Stock.where(name: acc).average(:aquisition_value).to_f.round(2)
    value = Value.find_by(name: acc)
    @valores[:valor] = if value.nil?
                         0
                       else
                         value.value
                       end
    @valores
  end

  def show
    @facade = Facade.find_by(params[:facade_id])
  end
end