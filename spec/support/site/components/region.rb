class Region < Peek::Component
  select_by class: "components-RegionBlock-style---container", visible: true

  def title
    div(class: "data-metrics-region-name").text
  end
end
