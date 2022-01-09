class Admin::SalesController < ApplicationController
  def index
    @sales = Sale.all
  end

  # TODO: imeplement sales#new and sales#create
  def new
  end

  def create
  end

  def destroy
    @sale = Sale.find params[:id]
    puts params[:id]
    @sale.destroy
    redirect_to [:admin, :sales], flash: { danger: "#{@sale.name} sale deleted!" }
  end
end
