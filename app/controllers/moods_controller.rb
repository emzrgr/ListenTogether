class MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end

  def show
    @mood = Mood.find(params[:id])
    @user_mood = UserMood.find_by(user_id: current_user.id, mood_id: @mood.id)
      if @user_mood
        @user_mood_musics = UserMoodMusic.where(user_mood_id: @user_mood.id)
      else
        @user_mood_musics = []
      end
  end
end
