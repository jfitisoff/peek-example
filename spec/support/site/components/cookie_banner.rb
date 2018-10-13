class CookieBanner < Peek::Component
  select_by class: "components-GdprPrompt-style---cookieBanner"

  span :close_button, class: "components-GdprPrompt-style---closeButton"

  def close
    close_button.click
    sleep 0.1
  end
end
