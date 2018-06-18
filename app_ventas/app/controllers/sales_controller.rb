class SalesController < ApplicationController
  def index
    @sale = Sale.all
  end
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)
    value = @sale.value
    descuent = @sale.discount
    tax = @sale.tax
    total_descuento = value + ((value * descuent) / 100)
    if tax.zero?
      @iva_incl = total_descuento
    else
      @iva_incl = total_descuento + (total_descuento * 0.19)
      @sale.tax = 19
    end
    @sale.save!
    redirect_to done_path
  end

  def done
    @sale = Sale.find(params[:cod])
  end

  private

  def sale_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end
end
