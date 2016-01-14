class LinksController < ApplicationController
  before_action :load_link, only: [:edit, :update]

  def new
    @links = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      redirect_to links_path
      flash[:success] = "Link successfully saved!"
    else
      redirect_to links_path
      flash[:errors] = "Must be a valid link"
    end
  end

  def edit
  end

  def update
    if @link.update_attributes(link_params)
      flash[:success] = "Link successfully updated!"
      redirect_to links_path
    else
      flash.now[:errors] = "Must be a valid link"
      render :edit
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :link, :read_status)
    end

    def load_link
      @link = Link.find(params[:id])
    end
end
