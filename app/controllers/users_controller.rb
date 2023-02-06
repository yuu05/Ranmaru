class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def index
    @user = current_user
    @users = User.all
    @dog = DogImage.new
  end

  def show
    @user = User.find(params[:id])
    @dog = DogImage.new
    @dogs = @user.dog_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end

  def create
    @dog = DogImage.new(dog_image_params)
    @dog.user_id = current_user.id
    if @dog.save
      redirect_to dog_images_path(@dog.id), notice: 'You have created image successfully.'
    else
      @user = current_user
      @dogs = DogImage.all
      render template: "dog_images/index"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def dog_image_params
    params.require(:dog_image).permit(:title, :image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end

end
