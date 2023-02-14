defmodule Cp.GetCareProviderRequest do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: :string
end

defmodule Cp.GetCareProviderReply do
  @moduledoc false
  use Protobuf, protoc_gen_elixir_version: "0.11.0", syntax: :proto3

  field :id, 1, type: :string
  field :first_name, 2, type: :string, json_name: "firstName"
  field :last_name, 3, type: :string, json_name: "lastName"
  field :external_id, 4, type: :string, json_name: "externalId"
  field :organization, 5, type: :string
  field :account_token, 6, type: :string, json_name: "accountToken"
end

defmodule Cp.CP.Service do
  @moduledoc false
  use GRPC.Service, name: "cp.CP", protoc_gen_elixir_version: "0.11.0"

  rpc :GetCareProvider, Cp.GetCareProviderRequest, Cp.GetCareProviderReply
end

defmodule Cp.CP.Stub do
  @moduledoc false
  use GRPC.Stub, service: Cp.CP.Service
end