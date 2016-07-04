# psonix

It's an app to see the ps process in realtime using [phoenix framework](phoenixframework.org)

1. Simple bash installation
2. Use phoenix channels to present in realtime the CPU, Memmory and disk status
3. Add any server from any location to monitor


This command streams over port 9000 the selected command
```
top -n 10000 -b | nc -l 9000
```

```elixir
{:ok, data_agent} = Agent.start_link(fn -> [] end)

defmodule TopReceiver do
  def start(data_agent) do
    Port.open({:spawn, "top -n 10000 -d 1 -b"}, [])
    # Once we've opened that port, we'll just loop, passing the data agent into
    # the loop function
    loop(data_agent)
  end

  def loop(data_agent) do
    IO.puts "LOOP"
    # Our port will be sending us messages regularly with the data from stdout.
    # Let's catch that and push it into the agent.
    receive do
      {_, {:data, data}} ->
        Agent.update(data_agent, fn(existing_data) ->
          IO.inspect data
          data ++ existing_data
        end)
      # If we get data we aren't expecting, it'd be nice to not crash.
      other -> IO.inspect "got other: #{inspect other}"
    end
    # And of course then we just tail-call
    loop(data_agent)
  end
end

# Now we spawn the audio receiver, and it will constantly update our agent.
spawn(fn() ->
  TopReceiver.start(data_agent)
end)
```

if you copy to a file like `top_receiver.ex` and
run `iextop_receiver.ex` you will see the output
