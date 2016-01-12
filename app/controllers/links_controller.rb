class LinksController < ApplicationController

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
    @link = Link.find(params[:id])
  end


  def update
    @link = Link.find(params[:id])
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
end
