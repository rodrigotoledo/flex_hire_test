class Api::V1::UserController < Api::ApplicationController
  def index
    render json: User.return_current
  end
end
