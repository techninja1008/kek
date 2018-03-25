defmodule Kek.Consumer do
  use Nostrum.Consumer
  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__, %{})
  end

  def handle_event({:MESSAGE_CREATE, {msg}, _ws_state}, state) do
    with <<"." :: binary, cmd :: binary>> <- msg.content do
      args = cmd |> String.split(" ")
      
      case args do
        ["summon"] ->
          spawn(fn -> kek_summon(msg) end)
      end
    end
    
    if msg.content |> String.downcase |> String.contains?(["kek", "pepe"]) do
      spawn(fn -> kek_summon(msg) end)
    end

    {:ok, state}
  end

  # Default event handler, if you don't include this, your consumer WILL crash if
  # you don't have a method definition for each event type.
  def handle_event(_, state) do
    {:ok, state}
  end
  
  def kek_summon(msg) do
    Api.update_status("online", "the mortal realms")
    
    Api.create_message(msg.channel_id, "I HAVE BEEN SUMMONED!")
    Api.create_message(msg.channel_id, "What is your wish?")
    
    :timer.apply_after(10000, Kek.Consumer, :kek_sleeps, [msg.channel_id])
  end
  
  def kek_sleeps(channel) do
      Api.create_message(channel, "I am too intelligent for this mortal realm.")
      
    Api.update_status("online", "some higher state of existence")
  end
end