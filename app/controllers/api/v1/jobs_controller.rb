class Api::V1::JobsController < Api::ApplicationController
  def index
    render json: Job.return_current
  end
end
