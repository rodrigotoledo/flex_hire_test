class ProfileController < ApplicationController
  def index
    @profile = Profile.return_current
  end
end
