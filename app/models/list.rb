class List < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
end

# dependent: :destroy (toda vez que eu deletar uma lista especificamente, ele vai nas bookmarks com a lista dessa referencia e apagar).
