class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    # usa o id para pegar uma lista especifica
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    # no parametro list vai ter conteudo para criar um nome
    @list = List.new(list_params)
    # list_params `e um strong params
    if @list.save
      redirect_to @list
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
