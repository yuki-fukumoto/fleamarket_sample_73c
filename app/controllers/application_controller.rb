class ApplicationController < ActionController::Base
  before_action :basic_auth , if: :production?

  before_action :configure_permitted_parameters, if: :devise_controller?
  private

  def production?
    Rails.env.production?
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end


  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, address_attributes: [:firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, :building, :room, :telephone]])
  end

  def confirm_user_signed_in?
    if user_signed_in?
    else
      redirect_to root_path, notice: 'ログイン後、操作してください'
    end
  end

end


