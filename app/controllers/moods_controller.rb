class MoodsController < ApplicationController

  before_action :authenticate_user!
  def index
    @moods = Mood.all
  end

  def show
    @mood = Mood.find(params[:id])
    @musics = @mood.musics
  end
end
