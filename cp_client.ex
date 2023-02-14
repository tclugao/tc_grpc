defmodule Grpc.CpClient do
  use GenServer

   # Client
  def start_link(default_map) when is_map(default_map) do
    GenServer.start_link(__MODULE__, default_map, name: __MODULE__)
  end

  def get_care_provider(uuid) do
    GenServer.call(__MODULE__, {:get_care_provider, uuid})
  end



  # Server (callbacks)
  @impl true
  def init(state_map) do
    {:ok, channel} = GRPC.Stub.connect("localhost:50051")
    {:ok, Map.put(state_map, :channel, channel)}
  end


  @impl true
  def handle_call({:get_care_provider, uuid}, _from, state_map) do
    channel = Map.fetch!(state_map, :channel)
    request = Cp.GetCareProviderRequest.new(id: uuid)
    {:ok, reply} = channel |> Cp.CP.Stub.get_care_provider(request)
    {:reply, reply, state_map}
  end
end
