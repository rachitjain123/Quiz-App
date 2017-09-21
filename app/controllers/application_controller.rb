class ApplicationController < ActionController::Base
  include SessionsHelper
  def hello
  end
  protect_from_forgery with: :null_session

end