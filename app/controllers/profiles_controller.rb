# frozen_string_literal: true

class ProfilesController < OpenReadController
  before_action :set_profile, only: [:update]

  # GET /profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /profiles/1
  def show
    render json: Profile.find(params[:id])
  end

  # POST /profiles
  # def create
  #   @profile = Profile.new(profile_params)
  #
  #   if @profile.save
  #     render json: @profile, status: :created
  #   else
  #     render json: @profile.errors, status: :unprocessable_entity
  #   end
  # end

  # PATCH/PUT /profiles/1
  def update
    if @profile.update(profile_params)
      head :no_content
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_profile
    @profile = Profile.find_by(id: params[:id], user: current_user)
  end
  private :set_profile

  # Only allow a trusted parameter "white list" through.
  def profile_params
    params.require(:profile).permit(:given_name, :surname, :gender, :dob)
  end
  private :profile_params
end
