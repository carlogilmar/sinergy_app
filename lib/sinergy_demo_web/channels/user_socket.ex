defmodule SinergyDemoWeb.UserSocket do
  use Phoenix.Socket

  ## Channels
  channel "sinergy:*", SinergyDemoWeb.SinergyChannel

  def connect(_params, socket, _connect_info) do
    {:ok, socket}
  end

  def id(_socket), do: nil
end
