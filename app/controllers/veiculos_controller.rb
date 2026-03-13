class VeiculosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_veiculo, only: [:show, :edit, :update, :destroy]

  def index
    @q = Veiculo.ransack(params[:q])

    @pagy, @veiculos = pagy(
      @q.result(distinct: true).order(created_at: :desc),
      items: 5
    )

    @total_veiculos = Veiculo.count
  end

  def show
  end

  def new
    @veiculo = Veiculo.new
  end

  def create
    @veiculo = Veiculo.new(veiculo_params)

    if @veiculo.save
      redirect_to veiculos_path, notice: "Veículo cadastrado com sucesso."
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @veiculo.update(veiculo_params)
      redirect_to veiculos_path, notice: "Veículo atualizado com sucesso."
    else
      render :edit
    end
  end

  def destroy
    @veiculo = Veiculo.find(params[:id])
    @veiculo.destroy
    redirect_to veiculos_path, notice: "Veículo excluído com sucesso."
  end

  private

  def set_veiculo
    @veiculo = Veiculo.find(params[:id])
  end

  def veiculo_params
    params.require(:veiculo).permit(:marca, :modelo, :ano, :placa)
  end
end