defmodule SinergyDemoWeb.SinergyChannel do
  use Phoenix.Channel
	alias SinergyDemo.Utils

  def join("sinergy:app", _msg, socket) do
    {:ok, [], socket}
  end

  def handle_in("sinergy:calculate", view_data, socket) do
    network =
      view_data
        |> Utils.build_network_from_data()
        |> Utils.process_network()
		IO.inspect network
    {:reply, {:ok, %{ message: "que onda perro!"}}, socket}
  end

end
