class UserMoodMusicsController < ApplicationController

  before_action :set_last_music_message, only: [:create, :new]
  before_action :set_mood, only: [:create, :new, :destroy]

  def index
  end

  def new
    @user_mood_music = UserMoodMusic.new
    @message = Message.new
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
    user_mood_music = UserMoodMusic.find_by(
      user_mood_id: UserMood.find_by(user_id: current_user.id, mood_id: @mood.id)&.id,
      music_id: params[:id]
    )

    if user_mood_music
      user_mood_music.destroy
      flash[:success] = "Music removed from your mood."
    else
      flash[:alert] = "Music not found for this mood."
    end

    redirect_back fallback_location: new_mood_user_mood_music_path(@mood)
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end

  def set_last_music_message
    @last_message = Message&.where(task: "music_generator").last
  end
end
