class Api::ApplicationController < ActionController::API

  protected

  def check_access
    # TODO: implement the access like devise or something
    return true
  end
end
