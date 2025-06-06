class MessagesController < ApplicationController

 SYSTEM_PROMPT = "Tu es un assistant musical. Lorsqu’un utilisateur sélectionne un “mood” (ex. : joyeux, triste, nostalgique, motivé, amoureux…), tu dois recommander une chanson qui correspond émotionnellement à ce mood.\
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
                    -Privilégie les suggestions originales, variées, mais cohérentes émotionnellement.\
                    -Tu es créatif, pertinent, et tu adaptes tes réponses à l’émotion humaine derrière chaque mood.
                    -Ne me renvoie jamais une musique dans la liste que je t'envoie. Ne propose jamais la musique 'Happy' de Pharell WIliams"
  def generate_music
    @mood = Mood.find(params[:mood_id])
    @message = Message.new(role: "user", content: @mood.name, mood_id: @mood.id )
    @all_musics = Message.where(task: "music_generator")

    if @message.save
      @chat = RubyLLM.chat
      @llm_chat = @chat.with_instructions(SYSTEM_PROMPT)

      @all_musics.each do |music|
         @llm_chat.add_message(role: music.role, content: music.content)
      end

      response = @llm_chat.ask(@message.content)
      Message.create(role: "assistant", content: response.content, mood_id: @mood.id, task: "music_generator")
      redirect_to  new_mood_user_mood_music_path(@mood)
    else
       Rails.logger.error "Message errors: #{@message.errors.full_messages}"
      flash[:error] = @message.errors.full_messages.to_sentence
       redirect_to  new_mood_user_mood_music_path(@mood)
    end
  end

  def create
    @chat = Chat.find(params[:chat_id])
    @message = Message.new(message_params.merge(role: "user", chat: @chat))

    if @message.save
      music_title = @chat.user_mood_music.music.title
      music_artist = @chat.user_mood_music.music.artist
      chat = RubyLLM.chat(model: "gpt-4.1")
      @llm_chat = chat.with_instructions("Tu es un assistant musical, nous allons parler de #{music_title} de #{music_artist}")

      @chat.messages.each do |message|
        @llm_chat.add_message(role: message.role, content: message.content)
      end

      response = @llm_chat.ask(@message.content)
      Message.create(role: "assistant", content: response.content, chat: @chat)
      redirect_to chat_path(@chat)
    else
      flash[:alert] = @message.errors.full_messages.join(', ')
      redirect_to chat_path(@chat)
    end
  end

   private

  def message_params
    params.require(:message).permit(:content)
  end

end
