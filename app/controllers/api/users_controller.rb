class Api::UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all
    render json:{data:users,status:200}
  end

  def create
    user = User.new(user_params)
    if user.save
      render json:{data:user,message:"User successfully added",status:200}
    else
      render json:{errors:user.errors.full_messages,status:400}
    end
  end

  def show
    user = User.find_by(id:params[:id])
    binding.pry
    if user.present?
      render json:{data:user,status:200}
    else
      render json:{message:"User not found",status:400}
    end
  end

  def update
    user = User.find(params[:id])
    if user.update(user_params)
      render json:{data:user,message:"User successfully updated",status:200}
    else
      render json:{errors:user.errors.full_messages,status:400}
    end
  end

  def destroy
    user = User.find(params[:id])
    if user.destroy
      render json:{message: 'User successfully deleted',status:200}
    else
      render json:{errors: "Failed to delete user",status:400}
    end
  end

  private
  def user_params
    params.require(:user).permit(:firstName,:lastName,:email)
  end

end
