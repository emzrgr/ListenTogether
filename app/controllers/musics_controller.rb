class MusicsController < ApplicationController

  def show
    @music = Music.find(params[:id])
  end

  def new
    @music = Music.new
  end

  def create
    @mood = Mood.find(params[:mood_id])
    # chopper mood.name et l'envoyer au llm avec le prompt
    # recup le message du llm et trier en titre album etc
    # faire un music.new avec le message du llm en argument
    @music = Music.new(mood_params)
  end

  private

end
