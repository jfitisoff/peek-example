def new_session
  site = Peek.new(PROD_BASE_URL)
  site.open
  site.home_page
  site
end
