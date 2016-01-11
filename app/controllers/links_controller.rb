class LinksController < ApplicationController

  def index
    if current_user.links !=
      @links = current_user.links
    end
  end

  def new
    @links = Link.new
  end

  def create
    @links = current_user.links.new(link_params)
    if @links.save
      redirect_to links_path, notice: "Link successfully saved!"
    else
      render :new
    end
  end

  private
    def link_params
      params.require(:link).permit(:title, :link)
    end
end
