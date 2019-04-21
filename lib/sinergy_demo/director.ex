defmodule SinergyDemo.Director do
  use GenServer

  @songs [
    %{"song" => "a"},
    %{"song" => "b"},
    %{"song" => "c"},
    %{"song" => "d"},
    %{"song" => "e"},
    %{"song" => "f"},
    %{"song" => "g"},
    %{"song" => "h"}
  ]

  def start_link() do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  def get_current() do
    GenServer.call( __MODULE__, :get_song )
  end

  def suscribe() do
    GenServer.call( __MODULE__, :suscribe)
  end

  def init(_) do
    {:ok, {:counter, 0} }
  end

  def handle_call( :get_song, _, state) do
    {:reply, state, state}
  end

  def handle_call( :suscribe, _, {:counter, counter} ) do
    { counter, song, next_counter } = suscribe_song( counter )
    {:reply, {counter, song}, {:counter, next_counter}}
  end

  def suscribe_song( 8 ) do
    [ first_song | _ ] = @songs
    { 0, first_song, 1 }
  end

  def suscribe_song( current_counter ) do
    song = Enum.at( @songs, current_counter)
    { current_counter, song, current_counter + 1 }
  end

end
