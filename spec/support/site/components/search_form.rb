class SearchForm < Peek::Component
  select_by tag_name: "form", class: "search-page-form", visible: true

  places_input :where
  addon_input :what, visible: true
  datepicker :start, index: 0
  datepicker :end, index: 1
  button :search_button, type: "submit"
  alias_method :when, :start

  def search(**kwargs)
    update_object(kwargs)
    search_button.click
    kwargs
  end
end
