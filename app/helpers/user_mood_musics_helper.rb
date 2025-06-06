module UserMoodMusicsHelper
  def remove_music_button(mood, music)
    link_to "❌",
      mood_user_mood_music_path(mood, music.id),
      data: {
        turbo_method: :delete,
        turbo_confirm: "Are you sure you want to remove this song from your mood?"
      },
      class: "btn btn-outline-danger btn-sm"
  end
end