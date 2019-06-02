defmodule SinergyDemoWeb.SinergyChannel do
  use Phoenix.Channel
	alias SinergyDemo.Director

  def join("sinergy:app", _msg, socket) do
    {:ok, [], socket}
  end

  def handle_in("sinergy:calculate", payload, socket) do
		IO.puts "=========="
		IO.inspect payload
		IO.puts "=========="
    {:reply, {:ok, %{ message: "que onda perro!"}}, socket}
  end

end
