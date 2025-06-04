class MessagesController < ApplicationController

  SYSTEM_PROMPT = "Tu es un assistant musical. Lorsqu’un utilisateur sélectionne un “mood” (ex. : joyeux, triste, nostalgique, motivé, amoureux…), tu dois recommander une chanson qui correspond émotionnellement à ce mood.\
                      Ta réponse doit être au format JSON, comme dans l’exemple suivant :
                    {
                      'artist': 'Nom de l'artiste',
                      'title': 'Titre de la chanson',
                      'album': 'Nom de l'album',
                      'lyrics': 'Paroles de la chanson',
                      'cover': 'URL de la pochette'
                    }
                    Contraintes obligatoires :\
                    -N'écris pas de petit texte explicatif.\
                    -N'invente pas d'url d'image si tu n'en trouve pas.
                    -Ne recommande jamais une chanson ou un artiste déjà proposé précédemment, même pour un autre mood.\
                    -Si tu n’as pas de mémoire, considère chaque requête comme unique et fais varier au maximum les styles, artistes, langues et époques.\
                    -Privilégie les suggestions originales, variées, mais cohérentes émotionnellement.\
                    -Tu es créatif, pertinent, et tu adaptes tes réponses à l’émotion humaine derrière chaque mood."


  def create
    @mood = Mood.find(params[:mood_id])
    @message = Message.new(role: "user", content: @mood.name, mood_id: @mood.id)
    if @message.save
      @chat = RubyLLM.chat
      response = @chat.with_instructions(SYSTEM_PROMPT).ask(@message.content)
      Message.create(role: "assistant", content: response.content, mood_id: @mood.id)
      redirect_to new_mood_music_path(@mood)
    else
       redirect_to new_mood_music_path(@mood)
    end
  end
end
