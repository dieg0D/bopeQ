class NotificationsController < ApplicationController
  before_action :select_negociator

  def webhook
    @data = params[:form_response][:answers]
    if @primary
      @primary.available = @primary.available - 1
      @primary.save
    end
    if @secondary
      @secondary.available = @secondary.available - 1
      @secondary.save
    end
    @contact = Contact.create(name: @data[0][:text], enterprise: @data[1][:text], email: @data[2][:email], phone: @data[3][:number], reason_for_contact: @data[4][:label], description: @data[5][:text], primary: @primary, secondary: @secondary)
    render json: {}, status: :ok
  end

  def select_negociator
    @primary = User.primary.filter { |user| user.available? && user != Contact&.last&.primary }.sample
    @secondary = User.secondary.filter { |user| user.available? && user != Contact&.last&.secondary }.sample
  end
end
