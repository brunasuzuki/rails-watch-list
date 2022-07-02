class ListsController < ApplicationController
  def index
    @lists = List.all
  end
end

# to list all movies
