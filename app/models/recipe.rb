class Recipe < ApplicationRecord
  belongs_to :user

  def toggle_privacy
    self.public = !self.public
    self.save
  end
end
