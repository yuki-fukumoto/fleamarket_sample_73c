# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :move_to_index, except: [:index, :show]
  before_action :configure_permitted_parameters, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @addresses = @user.addresses.build
  end

  # POST /resource
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path, notice: "ユーザ登録が完了しました"
    else
      render :new
    end


    
  end

  private

  def address_params
    params.permit(address: [:firstname, :lastname, :firstname_read, :lastname_read, :first_zip, :last_zip, :prefecture, :city, :address_line, :building, :room, :first_telephone, :second_telephone, :third_telephone])[:address].merge(user_id: @user.id)
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :birthday, :firstname, :lastname, :firstname_read, :lastname_read, addresses_attributes: [:firstname, :lastname, :firstname_read, :lastname_read, :first_zip, :last_zip, :prefecture, :city, :address_line, :building, :room, :first_telephone, :second_telephone, :third_telephone]).merge(encrypted_password: Devise::Encryptor.digest(User, params[:user][:password]))
  end
end  
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :firstname, :lastname, :firstname_read, :lastname_read, :birthday, address: [:firstname, :lastname, :firstname_read, :lastname_read, :zip, :prefecture, :city, :address_line, :building, :room, :telephone]])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
# end