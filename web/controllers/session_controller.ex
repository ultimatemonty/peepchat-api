defmodule Peepchat.SessionController do
    use Peepchat.Web, :controller

    def index(conn, _params) do
        # return some statuc json for now
        conn
        |> json(%{status: "Ok"})
    end
end
