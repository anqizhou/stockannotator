class ApplicationController < ActionController::Base
  # XXX: Disable CSRF protection for now to simplify the code.
  # protect_from_forgery with: :null_session

  respond_to :html, :json
end
