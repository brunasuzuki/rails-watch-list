class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    # usa o id para pegar uma lista especifica
    @list = List.find(params[:id])
  end
end
