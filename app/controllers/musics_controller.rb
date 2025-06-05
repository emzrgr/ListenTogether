class MusicsController < ApplicationController

  before_action :set_mood, only: [:create]

  def show
    @music = Music.find(params[:id])
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end
end
