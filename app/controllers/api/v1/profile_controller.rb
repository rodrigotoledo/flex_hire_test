class Api::V1::ProfileController < Api::ApplicationController
  def index
    render json: Profile.return_current
  end
end
