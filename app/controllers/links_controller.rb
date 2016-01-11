class LinksController < ApplicationController

  def index
    if current_user.links != nil
      @links = current_user.links
    end
  end

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

  private
    def link_params
      params.require(:link).permit(:title, :link)
    end
end
