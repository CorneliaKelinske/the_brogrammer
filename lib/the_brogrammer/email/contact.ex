defmodule TheBrogrammer.Email.Contact do
  @moduledoc """
  Contact form email to be sent to admin
  """

  alias TheBrogrammer.Email.Content
  import Ecto.Changeset

  @doc "Ensure that data is valid before sending"
  def changeset(attrs) do
    {%Content{}, Content.types()}
    |> cast(attrs, [:from_email, :name, :subject, :message, :answer, :not_a_robot])
    |> validate_required([:from_email, :name, :subject, :message],
      message: "This box must not be empty!"
    )
    |> validate_length(:message,
      min: 10,
      max: 1000,
      message: "Message needs to be between 10 and 1000 characters"
    )
  end
end
