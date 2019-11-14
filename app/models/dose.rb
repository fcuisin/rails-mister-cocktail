class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail, presence: true, uniqueness: { scope: :ingredient_id }
  validates :ingredient, presence: true, uniqueness: { scope: :cocktail_id }
end
