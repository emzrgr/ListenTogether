class UserMoodsController < ApplicationController

  before_action :set_mood, only: [:create, :new]

  def new
    @messages = Message.where(role: "assistant" )
    @user_mood = UserMood.new
    @message = Message.new
  end

  def create
    @message = Message.new
    json_message = Message.last.content
    message_hash = JSON.parse(json_message)
    @music = Music.new(artist: message_hash["artist"], title: message_hash["title"], album: message_hash["album"])
      if @music.save
        @user_mood = UserMood.create(mood_id: @mood.id, user_id: current_user.id, music_id: @music.id)
        redirect_to new_mood_user_mood_path(@mood)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end
end
