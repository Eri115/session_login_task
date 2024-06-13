class ApplicationController < ActionController::Base
  include SessionsHelper

  def login_required
    redirect_to new_session_path unless current_user
  end

end
