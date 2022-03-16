defmodule TheBrogrammerWeb.PostController do
  use TheBrogrammerWeb, :controller
  alias TheBrogrammer.Blog
  alias TheBrogrammerWeb.ErrorView

  @spec index(Plug.Conn.t(), map) :: Plug.Conn.t()
  def index(conn, %{"page" => page}) do
    assigns = [
      page: page,
      posts: Blog.list_posts(page),
      tags: Blog.tags_with_count(),
      page_title: "Blog"
    ]

    render(conn, "index.html", assigns)
  end

  def index(conn, _params) do
    assigns = [
      page: 1,
      posts: Blog.list_posts(1),
      tags: Blog.tags_with_count(),
      page_title: "Blog"
    ]

    render(conn, "index.html", assigns)
  end

  @spec show(Plug.Conn.t(), map) :: Plug.Conn.t()
  def show(conn, %{"id" => id}) do
    case Blog.fetch_post(id) do
      {:ok, post} ->
        render(conn, "show.html", post: post, page_title: post.title)

      _ ->
        render(conn, ErrorView, "404.html")
    end
  end
end
