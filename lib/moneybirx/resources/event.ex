defmodule Moneybirx.Event do
  defstruct [
    :administration_id,
    :user_id,
    :action,
    :link_entity_id,
    :link_entity_type,
    :data,
    :created_at,
    :updated_at,
  ]
end
