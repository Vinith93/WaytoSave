class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :destroy, :show, :update]
  before_action :authenticate, only: [:edit, :update ,:destroy]
    def new
      @user = User.new
    end
      
    def create
      @user = User.new(user_params)
      respond_to do |format|
       if @user.save
         format.html { redirect_to new_user_profile_path(@user), :notice => "User Sucessfully created" }
       else
        format.html { render :new }
       end
      end
    end
    #profiles_path
    def edit
      @user = current_user
    end

    def update
      @user = current_user
      if @user.update(user_params)
        redirect_to user, :notice => 'User Sucessfully updated'
      else
        render :edit
      end
    end

    def show
    end

    def destroy
    end

 private

  def set_user
    @user = current_user
  end
    
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :bio, :birth_day, :twitter, :login)
  end
end
