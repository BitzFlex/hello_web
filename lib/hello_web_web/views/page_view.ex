defmodule HelloWebWeb.PageView do
  use HelloWebWeb, :view

  def render("response1.html", _assigns) do
    "/Response1 의 응답입니다."
  end

end
