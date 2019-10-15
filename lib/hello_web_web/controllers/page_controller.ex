defmodule HelloWebWeb.PageController do
  use HelloWebWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def hello(conn,_param) do
    html conn, """
    <HTML>
    <HEAD>
    <TITLE> Hello !! </TITLE> </HEAD>
    <BODY>
        <h1> Hello Phoenix Web </h1>
    </BODY>
    </HTML>
    """
  end

  def now(conn,_param) do
    now = :calendar.local_time() |> NaiveDateTime.from_erl! |> NaiveDateTime.to_string

    html conn, """
    <HTML>
    <HEAD>
    <TITLE> Now </TITLE> </HEAD>
    <BODY>
        <h1> #{now} </h1>
    </BODY>
    </HTML>
    """
  end


  def calc(conn,%{"a" => valueA , "b" => valueB}) do
    sumValue = String.to_integer(valueA) + String.to_integer(valueB)
    json conn, %{result: :ok, sum: sumValue}
  end

  def calc(conn,_param) do
    json conn, %{result: :error}
  end


  def response1(conn, _param) do
    render(conn, "response1.html")
  end


  def response2(conn, _param) do
    render(conn, "response2.html")
  end


  def greeting1(conn, %{"name" => name}) do
    render(conn, "greeting.html",[name: name])
  end

  def greeting2(conn, %{"name" => name}) do
    conn 
      |> assign(:name, name)
      |> render("greeting.html")
  end


end

