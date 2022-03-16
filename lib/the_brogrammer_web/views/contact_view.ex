defmodule TheBrogrammerWeb.ContactView do
  use TheBrogrammerWeb, :view

  def display_captcha(captcha_image) do
    content_tag(:img, "", src: "data:image/png;base64," <> captcha_image)
  end
end
