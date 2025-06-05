class UserMoodMusicsController < ApplicationController

  before_action :set_last_message, only: [:create, :new]
  before_action :set_mood, only: [:create, :new, :destroy]
  def index

  end

  def new
    @user_mood_music = UserMoodMusic.new
    @message = Message.new
    if @last_message.present?
      @hide_button = !!Music.find_by(title: JSON.parse(@last_message.content)["title"])
    end
  end

  def create
    @message = Message.new
    message_hash = JSON.parse(@last_message.content)
    @music = Music.find_or_create_by(artist: message_hash["artist"], title: message_hash["title"], album: message_hash["album"])
    @user_mood = UserMood.find_or_create_by(mood_id: @mood.id, user_id: current_user.id)
      if @music.valid? && @user_mood.valid?
        UserMoodMusic.find_or_create_by(user_mood_id: @user_mood.id, music_id: @music.id)
        flash[:success] = "You liked this song!"
         redirect_to new_mood_user_mood_music_path(@mood)
      else
        render :new, status: :unprocessable_entity
      end
  end

  def destroy
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end

  def set_last_message
    @last_message = Message&.last
  end
end
