class Review < ApplicationRecord
  belongs_to :list
  validates :comment, presencetr: true
  validates :rating, numericality: { only_integer: true, greater_than_or_eaqual_to: 0, less_than_or_equal_to: 5 }
end


# rating so pode ser de 0 a 5 e inteiro
