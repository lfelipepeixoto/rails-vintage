class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:my_cars]

  def index
    @cars = Car.all
    if params[:query].present?
      @cars = @cars.search_car(params[:query])
    end
  end

  def show
    @car = Car.find(params[:id])
    @user = @car.user
  end

  def buy
    @car = Car.find(params[:id])
    @order = Order.new(order_params)
    @order.car = @car
    @order.user = current_user

    if @order.save
      flash[:notice] = 'Pedido de compra enviado com sucesso!'
      redirect_to my_cars_user_path(current_user)
    else
      render :show
    end
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    @car.user = current_user

    if @car.save
      redirect_to cars_path(@car)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Carro atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Carro excluído com sucesso!'
  end

  def about
    render 'about'
  end

  def contact
    @contact = "admin@admin.com / (11)988864545"
    render 'contact'
  end

  def my_cars
    @user_cars = current_user.cars
    @requested_cars = current_user.requested_cars
  end

  def policy
    render 'policy'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:order_date)
  end
  
  def car_params
    params.require(:car).permit(:manufacturer, :model, :year, :km, :price, :color, :photo)
  end
end
