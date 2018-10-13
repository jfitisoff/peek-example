class Category < Peek::Component
  select_by class: "components-CategoryBlock-style---container", visible: true

  def title
    h3.text
  end
end
