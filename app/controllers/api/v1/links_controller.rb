class Api::V1::LinksController < ApplicationController
  respond_to :json

  def index
    respond_with Link.all.map {|l| l.read_status}, location: nil
  end

  def update
    link = Link.find(params[:id])
    if link.update(link_params)
      respond_with do |format|
        format.json { render(json: Link.find(params[:id]), status: 201) }
      end
    else
      render json: link.errors, status: 422
    end
  end

  def link_params
    params.require(:link).permit(:read_status)
  end
end
