class SearchPage < Peek::Page
  set_url "/search{?query*}"
  set_url_matcher /(com\/search|www.peek.com\/[a-z,A-Z,-])/

  search_form :find_activities, index: 1
end
