class ProfileController < ApplicationController
  def index
    @user_data = User.return_current
  end
end
