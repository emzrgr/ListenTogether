class MoodsController < ApplicationController

  before_action :authenticate_user!
  def index
    @moods = Mood.all
  end
  def show
    @mood = Mood.find(params[:id])
    @user_moods = UserMood.where(user_id: current_user.id, mood_id: @mood.id)
  end
end
