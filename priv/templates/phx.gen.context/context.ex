defmodule <%= inspect context.module %> do
  @moduledoc """
  The <%= inspect schema.alias %> Manager.
  """

  import Ecto.Query, warn: false
  alias <%= inspect schema.repo %>
end
