defmodule RomanRouter do
  use Plug.Router
  require EEx

  plug :match
  plug :dispatch

  EEx.function_from_file :defp, :template_roman_page, "templates/roman_numerals_page.eex", [:roman_numeral]

  get "/" do
    page_contents = template_roman_page(claim_cookie_value(conn))
    conn
    |> Plug.Conn.put_resp_content_type("text/html")
    |> Plug.Conn.send_resp(200, page_contents)
  end

  post "/arabic_number" do
    {:ok, body, _} = Plug.Conn.read_body(conn)
    arabic_value = Enum.at(Regex.run(~r/\d+/, body), 0)
    roman_value = WebRomanNumerals.convert(String.to_integer(arabic_value))
    store_cookie(conn, roman_value)
    |> redirect(to: "/")
  end

  match _ do
    send_resp(conn, 404, "Not found!")
  end

  def store_cookie(conn, value) do
    put_resp_cookie(conn, "roman_numeral", value)
  end

  def claim_cookie_value(conn) do
    Plug.Conn.fetch_cookies(conn).cookies["roman_numeral"]
  end

  def redirect(conn, [to: to]) do
    conn
    |> Plug.Conn.put_resp_header("location", to)
    |> Plug.Conn.resp(302, "")
    |> Plug.Conn.halt
  end

end
