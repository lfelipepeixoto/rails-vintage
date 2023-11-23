class CarsController < ApplicationController
  before_action :set_car, only: [:show, :edit, :update, :destroy]

  def index
    @cars = Car.all
  end

  def show
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
    @company_history = "Nossa empresa foi fundada em 20XX e tem uma rica história..."
    render 'about'
  end

  def contact
    @contact = "admin@admin.com / (11)988864545"
    render 'contact'
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:manufacturer, :model, :year, :km, :price, :color, :photo)
  end
end
