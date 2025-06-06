class MusicsController < ApplicationController
  def show
    @music = Music.find(params[:id])
    @user_mood = UserMood.find(params[:user_mood_id])
    @user_mood_music = UserMoodMusic.find_by(user_mood_id: @user_mood.id, music: @music)
    @chat = Chat.new
  end

end
