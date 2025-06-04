class MusicsController < ApplicationController

  before_action :set_mood, only: [:create, :new]

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
    @message = Message.new
    @messages = Message.all
  end

  def create
    # chopper mood.name et l'envoyer au llm avec le prompt
    # recup le message du llm et trier en titre album etc
    # faire un music.new avec le message du llm en argument
    @music = Music.new(mood_params)
  end

  private

  def set_mood
    @mood = Mood.find(params[:mood_id])
  end

end
