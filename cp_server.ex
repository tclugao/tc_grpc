defmodule Grpc.CpServer do
  use GRPC.Server, service: Cp.CP.Service

  def get_care_provider(request, _stream) do
    Cp.GetCareProviderReply.new(id: "Hello #{request.id}")
  end

end

defmodule CP.Endpoint do
  use GRPC.Endpoint

  # intercept(GRPC.Server.Interceptors.Logger)
  intercept(GRPC.Logger.Server)
  run (Grpc.CpServer)
end
