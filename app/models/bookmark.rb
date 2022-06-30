class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :comment, length: { minimum: 6 }
  # uniquiness do movie estendendo  para lista(scope)
  validates :movie_id, uniqueness: { scope: :list_id }
end

# has_many e belongs_to gera metodos, consegue pegar um filme especifico e associar com o bookmark
# .movie e vai dar o filme com a referencia
