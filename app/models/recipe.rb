class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods

  def toggle_privacy
    self.public = !self.public
    self.save
  end

end
