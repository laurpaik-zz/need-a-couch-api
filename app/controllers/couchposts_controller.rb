# frozen_string_literal: true

class CouchpostsController < OpenReadController
  before_action :set_couchpost, only: [:update, :destroy]

  # GET /couchposts
  def index
    @couchposts = Couchpost.all

    render json: @couchposts
  end

  # GET /couchposts/1
  def show
    render json: Couchpost.find(params[:id])
  end

  # POST /couchposts
  def create
    @couchpost = current_user.profile.couchposts.build(couchpost_params)

    if @couchpost.save
      render json: @couchpost, status: :created
    else
      render json: @couchpost.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /couchposts/1
  def update
    if @couchpost.update(couchpost_params)
      head :no_content
    else
      render json: @couchpost.errors, status: :unprocessable_entity
    end
  end

  # DELETE /couchposts/1
  def destroy
    @couchpost.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_couchpost
    @couchpost = current_user.profile.couchposts.find(params[:id])
  end
  private :set_couchpost

  # Only allow a trusted parameter "white list" through.
  def couchpost_params
    params.require(:couchpost).permit(:location)
  end
  private :couchpost_params
end
