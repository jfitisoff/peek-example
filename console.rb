#!/usr/bin/env ruby

require "pry"
require_relative "spec/spec_helper"

# s = new_session
s = Peek.new(PROD_BASE_URL)
s.open
s.home_page

puts "\n\nPry session started. Use 's' to access the site object.\n\n"

binding.pry
