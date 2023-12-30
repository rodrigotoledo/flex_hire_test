class JobsController < ApplicationController
  def index
    @jobs = Job.return_current
  end
end
