class OrdersController < ApplicationController
  def new
    @car = Car.find(params[:car_id])
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      flash[:notice] = 'Pedido criado com sucesso. Um email foi enviado para o vendedor. Ele entrará em contato para os acertos finais da transação.'
      redirect_to cars_path
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :car_id, :order_date)
  end
end
