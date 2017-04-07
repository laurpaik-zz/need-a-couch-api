# frozen_string_literal: true

class FriendshipsController < OpenReadController
  before_action :set_friendship, only: [:destroy]

  # GET /friendships
  def index
    @friendships = Friendship.all

    render json: @friendships
  end

  # GET /friendships/1
  def show
    render json: Friendship.find(params[:id])
  end

  # POST /friendships
  def create
    @friendship = current_user.profile.friendships.build(friendship_params)

    if @friendship.save
      render json: @friendship, status: :created
    else
      render json: @friendship.errors, status: :unprocessable_entity
    end
  end

  # DELETE /friendships/1
  def destroy
    @friendship.destroy

    head :no_content
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_friendship
    @friendship = current_user.profile.friendships.find(params[:id])
  end
  private :set_friendship

  # Only allow a trusted parameter "white list" through.
  def friendship_params
    params.require(:friendship).permit(:profile_id, :friend_id)
  end
  private :friendship_params
end
