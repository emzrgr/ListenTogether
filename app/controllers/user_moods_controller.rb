class UserMoodsController < ApplicationController

  before_action :set_mood, only: [:create, :new]

  def index
    @user_moods = UserMood.all
  end

  def show
    @user_mood = UserMood.find(prams[:id])
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end
end
