class MessagesController < ApplicationController

  def self.set_musics_to_skip
    messages = Message.where(role: "assistant")
    skip_musics = []
    messages.each do |message|
      hash = JSON.parse(message.content)
    skip_musics <<  hash["title"]
    end
    return skip_musics
  end


 def system_prompt
  musics_to_skip = MessagesController.set_musics_to_skip
  "Tu es un assistant musical. Lorsqu’un utilisateur sélectionne un “mood” (ex. : joyeux, triste, nostalgique, motivé, amoureux…), tu dois recommander une chanson qui correspond émotionnellement à ce mood.\
                      Ta réponse doit être au format JSON, comme dans l’exemple suivant :
                    {
                      \"artist\": \"Nom de l\'artiste\",
                      \"title\": \"Titre de la chanson\",
                      \"album\": \"Nom de l'album\",
                      \"cover\": \"URL de la pochette\"
                    }
                      Les guillemets doivent être des guillemets droits (\") et non des apostrophes (\').
                    Contraintes obligatoires :\
                    -N'écris pas de petit texte explicatif.\
                    -N’invente pas d’URL de pochette si tu n’en trouves pas : dans ce cas, laisse le champ \"cover\" vide ou mets une chaîne vide : "".
                    -Le titre de la chanson que tu recommandes ne doit en aucun cas apparaître dans cette liste : #{musics_to_skip}
                    -Si tu n’as pas de mémoire, considère chaque requête comme unique et fais varier au maximum les styles, artistes, langues et époques.\
                    -Privilégie les suggestions originales, variées, mais cohérentes émotionnellement.\
                    -Tu es créatif, pertinent, et tu adaptes tes réponses à l’émotion humaine derrière chaque mood."
 end

  def create
    @mood = Mood.find(params[:mood_id])
    @message = Message.new(role: "user", content: @mood.name, mood_id: @mood.id)
    if @message.valid?
      @chat = RubyLLM.chat
      response = @chat.with_instructions(system_prompt).ask(@message.content)
      Message.create(role: "assistant", content: response.content, mood_id: @mood.id)
      redirect_to  new_mood_user_mood_music_path(@mood)
    else
       redirect_to  new_mood_user_mood_music_path(@mood)
    end
  end
end
