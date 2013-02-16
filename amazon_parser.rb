require 'nokogiri'
require 'open-uri'
require 'JSON'
require 'mechanize'

a = Mechanize.new
a.follow_meta_refresh = true
a.redirect_ok = true