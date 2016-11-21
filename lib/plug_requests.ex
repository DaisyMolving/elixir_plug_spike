defmodule Router do

  defmacro __using__(_opts) do
    quote do
      def init(options) do
        IO.puts "starting up PlugRequest..."
        options
      end
      def call(conn, _opts) do
        route(conn.method, conn.path_info, conn)
      end
    end
  end
end

defmodule PlugRequest do
  use Router
  require EEx

  EEx.function_from_file :defp, :template_roman_page, "templates/roman_numerals_page.eex"

  def run_locally do
    {:ok, _} = Plug.Adapters.Cowboy.http PlugRequest, []
  end

  def route("GET", [], conn) do
    page_contents = template_roman_page
    conn
    |> Plug.Conn.put_resp_content_type("text/html")
    |> Plug.Conn.send_resp(200, page_contents)
  end

  def route(_method, _path, conn) do
    conn
    |> Plug.Conn.send_resp(404, "Couldn't find that page, sorry!")
  end

end
