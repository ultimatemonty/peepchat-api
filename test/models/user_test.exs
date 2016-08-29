defmodule Peepchat.UserTest do
  use Peepchat.ModelCase

  alias Peepchat.User

  @valid_attrs %{email: "peep@chat.app",
    password: "abcde12345",
    password_confirmation: "abcde12345"}
  @invalid_attrs %{}

  test "mis-matched password_confirmation does not work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "asd32131r2qs",
      password_confirmation: "32q321321weda"})
    refute changeset.valid?
  end

  test "missing password_confirmation does not work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "123qr3213we"})
    refute changeset.valid?
  end

  test "short password does not work" do
    changeset = User.changeset(%User{}, %{email: "joe@example.com",
      password: "12456",
      password_confirmation: "123456"})
    refute changeset.valid?
  end

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
