class MusicsController < ApplicationController

  before_action :set_mood, only: [:create, :new]

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
    @message = Message.new
    @messages = Message.where(mood_id: @mood.id, role: "assistant" )
  end

  def create
    json_message = Message.last.content
    message_hash = JSON.parse(json_message)
    @music = Music.new(artist: message_hash["artist"], title: message_hash["title"], album: message_hash["album"], mood_id: @mood.id )
      if @music.save
        redirect_to new_mood_music_path(@mood)
      else
        render :new, status: :unprocessable_entity
      end
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end
end
