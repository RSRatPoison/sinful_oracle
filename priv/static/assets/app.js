
const csrfToken = document
  .querySelector("meta[name='csrf-token']")
  ?.getAttribute("content");

if (!csrfToken) {
  console.error("Sinful Oracle: CSRF token was not found.");
} else if (!window.Phoenix?.Socket || !window.LiveView?.LiveSocket) {
  console.error("Sinful Oracle: Phoenix or LiveView JavaScript failed to load.");
} else {
  const liveSocket = new window.LiveView.LiveSocket(
    "/live",
    window.Phoenix.Socket,
    {
      params: {
        _csrf_token: csrfToken
      }
    }
  );

  liveSocket.connect();

  window.liveSocket = liveSocket;
}
