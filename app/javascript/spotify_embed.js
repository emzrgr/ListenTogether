window.onSpotifyIframeApiReady = (IFrameAPI) => {
  const element = document.getElementById('embed-iframe');
  const options = {
    uri: 'spotify:episode:7makk4oTQel546B0PZlDM5',
    width: '40%',
    height: 200
  };
  const callback = (EmbedController) => {
    document.querySelectorAll('.episode').forEach(episode => {
      episode.addEventListener('click', () => {
        EmbedController.loadUri(episode.dataset.spotifyId);
      });
    });
  };
  IFrameAPI.createController(element, options, callback);
};
