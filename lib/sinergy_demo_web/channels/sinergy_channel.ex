defmodule SinergyDemoWeb.SinergyChannel do
  use Phoenix.Channel
	alias SinergyDemo.Director

  def join("sinergy:app", _msg, socket) do
		{_, song} = Director.suscribe()
    {:ok, song, socket}
  end

end
