class MoodsController < ApplicationController
  def index
    @moods = Mood.all
  end

  def show
    @mood = Mood.find(params[:id])
    @musics = @mood.musics
  end
end
