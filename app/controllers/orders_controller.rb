class OrdersController < ApplicationController
  before_action :set_order, only: [:destroy]

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to @order, notice: 'Pedido criado com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: 'Pedido excluído com sucesso!'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:comment, :car_id)
  end
end
