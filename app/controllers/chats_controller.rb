class ChatsController < ApplicationController
  def show
    @user_mood_music = UserMoodMusic.find(params[:user_mood_music_id])
    @user_mood = @user_mood_music.user_mood_id
    @music = @user_mood_music.music_id
    @chat = Chat.find(params[:id])
    @message = Message.new
  end


  def create
    @user_mood_music = UserMoodMusic.find(params[:user_mood_music_id])
    @user_mood = @user_mood_music.user_mood_id
    @music = @user_mood_music.music_id
    @chat = Chat.create(user_mood_music_id: @user_mood_music.id )
     redirect_to user_mood_music_chat_path(@user_mood_music, @chat)
  end

end
