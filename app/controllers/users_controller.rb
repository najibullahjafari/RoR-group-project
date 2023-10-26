class UsersController < ApplicationController
  before_action :authenticate_user!
  def set_default_role
    self.role ||= :user
  end
end
