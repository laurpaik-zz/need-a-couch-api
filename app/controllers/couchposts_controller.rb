class CouchpostsController < ApplicationController
  before_action :set_couchpost, only: [:show, :update, :destroy]

  # GET /couchposts
  def index
    @couchposts = Couchpost.all

    render json: @couchposts
  end

  # GET /couchposts/1
  def show
    render json: @couchpost
  end

  # POST /couchposts
  def create
    @couchpost = Couchpost.new(couchpost_params)

    if @couchpost.save
      render json: @couchpost, status: :created, location: @couchpost
    else
      render json: @couchpost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /couchposts/1
  def update
    if @couchpost.update(couchpost_params)
      render json: @couchpost
    else
      render json: @couchpost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /couchposts/1
  def destroy
    @couchpost.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_couchpost
    @couchpost = Couchpost.find(params[:id])
  end
  private :set_couchpost

  # Only allow a trusted parameter "white list" through.
  def couchpost_params
    params.require(:couchpost).permit(:location)
  end
  private :couchpost_params
end
