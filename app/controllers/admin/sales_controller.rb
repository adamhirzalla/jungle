class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  # TODO: imeplement sales#new and sales#create
  def new
    @sale = Sale.new
  end

  def create
    @sale = Sale.new(sale_params)

    if @sale.save
      redirect_to [:admin, :sales], flash: { success: 'Sale created!' }
    else
      flash.now[:danger] = @sale.errors.full_messages.first
      render :new
    end
  end

  def destroy
    @sale = Sale.find params[:id]
    puts params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], flash: { danger: "#{@sale.name} sale deleted!" }
  end

  private

  def sale_params
    params.require(:sale).permit(
      :name,
      :starts_on,
      :ends_on,
      :percent_off
    )
  end
end
