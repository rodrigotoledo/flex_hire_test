class JobsController < ApplicationController
  def index
    @user_data = User.return_current
  end
end
