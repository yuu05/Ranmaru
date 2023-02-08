class DogImagesController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @user = current_user
    @dog = DogImage.new
    @dogs = DogImage.all
  end

  def show
    @dog = DogImage.new
    @dogs = DogImage.find(params[:id])
    @user = @dogs.user
  end

  def edit
    @dog = DogImage.find(params[:id])
  end

  def create
    @dog = DogImage.new(dog_image_params)
    @dog.user_id = current_user.id
    if @dog.save
      redirect_to dog_images_path(@dog.id), notice: '思い出は無事保存されました！'
    else
      @user = current_user
      @dogs = DogImage.all
      render :index
    end
  end

  def update
    @dog = DogImage.find(params[:id])
    if @dog.update(dog_image_params)
      redirect_to dog_images_path(@dog.id), notice: '無事変更しました！'
    else
      render :edit
    end
  end

  def destroy
    @dog = DogImage.find(params[:id])
    @dog.destroy
    redirect_to dog_images_path
  end
  
  private

  def dog_image_params
    params.require(:dog_image).permit(:title, :image)
  end

  def correct_user
    @dog = DogImage.find(params[:id])
    @user = @dog.user
    redirect_to(dog_images_path) unless @user == current_user
  end

end