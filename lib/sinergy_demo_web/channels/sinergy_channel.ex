defmodule SinergyDemoWeb.SinergyChannel do
  use Phoenix.Channel

  def join("sinergy:app", _msg, socket) do
    IO.puts "Socket ok"
    {:ok, %{}, socket}
  end

end
