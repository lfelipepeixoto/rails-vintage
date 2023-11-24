class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to @order, notice: 'Pedido criado com sucesso!'
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :car_id, :sale_date)
  end
end
