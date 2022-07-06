class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true

  # a lista tem relacao com o bookmark, pra depois chegar em movies
end

# dependent: :destroy (toda vez que eu deletar uma lista especificamente, ele vai nas bookmarks com a lista dessa referencia e apagar).
# has_many e belongs_to geram metodos
