class PrototypesController < ApplicationController
  #before_action :authenticate_user!, only: [:new, :edit,:destroy]

  def index
    @prototype=Prototype.all
    render collection:@prototype
  end

  def new
   @prototype=Prototype.new
  end

  def create
    @prototype=Prototype.create(prototypes_params)
    if @prototype.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment=Comment.new
    @prototype=Prototype.find(params[:id])
    @comments=@prototype.comments.includes(:user)
  end
  
  def edit
    @prototype=Prototype.find(params[:id])
    unless user_signed_in? && current_user.id==@prototype.user_id
      redirect_to action: :index
    end
  end

  def update
    @prototype=Prototype.find(params[:id])
    if @prototype.update(prototypes_params)
      redirect_to action: :show
    else
      render :edit
    end

  end

  def destroy
    @prototype=Prototype.find(params[:id])
    @prototype.destroy
    redirect_to action: :index
  end

  private
  def prototypes_params
    params.require(:prototype).permit(:title,:catch_copy,:concept,:image).merge(user_id:current_user.id)
  end
end
