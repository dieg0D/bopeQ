class ContactsController < ApplicationController
  before_action :authorize_request

  def index
    @current_user.primary
  end
end
