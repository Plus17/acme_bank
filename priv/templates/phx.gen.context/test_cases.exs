
  alias <%= inspect schema.module %>

  @invalid_attrs <%= Mix.Phoenix.to_text for {key, _} <- schema.params.create, into: %{}, do: {key, nil} %>

  test "list/0 returns all <%= schema.plural %>" do
    <%= schema.singular %> = insert(:<%= schema.singular %>)
    assert <%= inspect context.alias %>.list() == [<%= schema.singular %>]
  end

  test "get!/1 returns the <%= schema.singular %> with given id" do
    <%= schema.singular %> = insert(:<%= schema.singular %>)
    assert <%= inspect context.alias %>.get!(<%= schema.singular %>.id) == <%= schema.singular %>
  end

  describe "create/1" do
    test "with valid data creates a <%= schema.singular %>" do
      valid_attrs = <%= Mix.Phoenix.to_text schema.params.create %>

      assert {:ok, %<%= inspect schema.alias %>{} = <%= schema.singular %>} = <%= inspect context.alias %>.create(valid_attrs)<%= for {field, value} <- schema.params.create do %>
      assert <%= schema.singular %>.<%= field %> == <%= Mix.Phoenix.Schema.value(schema, field, value) %><% end %>
    end

    test "with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = <%= inspect context.alias %>.create(@invalid_attrs)
    end
  end

  describe "update/2" do
    test "with valid data updates the <%= schema.singular %>" do
      <%= schema.singular %> = insert(:<%= schema.singular %>)
      update_attrs = <%= Mix.Phoenix.to_text schema.params.update%>

      assert {:ok, %<%= inspect schema.alias %>{} = <%= schema.singular %>} = <%= inspect context.alias %>.update(<%= schema.singular %>, update_attrs)<%= for {field, value} <- schema.params.update do %>
      assert <%= schema.singular %>.<%= field %> == <%= Mix.Phoenix.Schema.value(schema, field, value) %><% end %>
    end

    test "with invalid data returns error changeset" do
      <%= schema.singular %> = insert(:<%= schema.singular %>)
      assert {:error, %Ecto.Changeset{}} = <%= inspect context.alias %>.update(<%= schema.singular %>, @invalid_attrs)
      assert <%= schema.singular %> == <%= inspect context.alias %>.get!(<%= schema.singular %>.id)
    end
  end

  test "delete/1 deletes the <%= schema.singular %>" do
    <%= schema.singular %> = insert(:<%= schema.singular %>)
    assert {:ok, %<%= inspect schema.alias %>{}} = <%= inspect context.alias %>.delete(<%= schema.singular %>)
    assert_raise Ecto.NoResultsError, fn -> <%= inspect context.alias %>.get!(<%= schema.singular %>.id) end
  end

  test "change/1 returns a <%= schema.singular %> changeset" do
    <%= schema.singular %> = insert(:<%= schema.singular %>)
    assert %Ecto.Changeset{} = <%= inspect context.alias %>.change(<%= schema.singular %>)
  end
