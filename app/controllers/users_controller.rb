class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:perfil]

  def perfil
    @user = current_user
  end

  def sign_out
    
  end
end
