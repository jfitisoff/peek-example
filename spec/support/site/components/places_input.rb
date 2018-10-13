class PlacesInput < Peek::Component
  select_by class: /^components-Forms-Search-PlacesInput/

  def_delegator :value, :text_input

  button :clear_button, class: /clearButton/

  def location_options
    ul.lis.to_a.map(&:text)
  end

  def set(location)
    input.click
    input.clear
    input.set(location)
    sleep 0.2
    if location_options.include?(location)
      li(text: location).click
    else
      raise "No exact match for location. Location options displayed were " \
      "'#{location_options.join("', '")}'"
    end
  end
  alias_method :update, :set

  def clear
    clear_button.click
  end
end
