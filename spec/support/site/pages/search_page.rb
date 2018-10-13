class SearchPage < Peek::Page
  set_url "/search{?query*}"
  set_url_matcher /(com\/search|www.peek.com\/[a-z,A-Z,-])/

  # There are two search forms on the page (The first one is just the 'where'
  # field.) Adding an accessor for the 'full' search just to differentiate for
  # testing.
  search_form :find_activities, index: 1
end
