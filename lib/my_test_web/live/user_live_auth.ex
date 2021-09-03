defmodule MyTestWeb.UserLiveAuth do
  import Phoenix.LiveView

  def mount(params, _session, socket) do
    socket =
      case params do
        %{"user_id" => user_id} ->
          assign_new(socket, :user_id, fn -> user_id end)

        _ ->
          socket
      end

    if socket.assigns[:user_id] do
      {:cont, socket}
    else
      {:halt, redirect(socket, to: "/login")}
    end
  end
end
