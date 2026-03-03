class VeiculosController < ApplicationController
    before_action :authenticate_user!
  before_action :set_veiculo, only: %i[ show edit update destroy ]

 def index
  @veiculos = current_user.veiculos
end