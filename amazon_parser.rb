# Gems/Dependencies
require 'nokogiri'
require 'open-uri'
require 'JSON'
require 'mechanize'

# Initialize Mechanize
a = Mechanize.new
a.follow_meta_refresh = true
a.redirect_ok = true

# Static Variables
city = "san diego"
type = "for sale"
category = "cell phones - by owner"
area = 'south san diego county'
title = 'Brand New iPhone 4S White 32GB'
price = "250"
location = "Rancho Santa Fe"
email = "abhiramesh@gmail.com"
description = "Brand New iPhone 4S White 32GB Brand New iPhone 4S White 32GB Brand New iPhone 4S White 32GB Brand New iPhone 4S White 32GB"


# Initialize New CL Post
a.get('https://post.craigslist.org')
post_url = a.page.uri.to_s.split('?')[0]

# City Input
select_city_name = a.page.at('//form/select')['name']
city_code = a.page.at("//form/select/option[text()[contains(.,'#{city}')]]")["value"]

hidden_name = a.page.at("//form/input[@type='hidden']")["name"]
hidden_value = a.page.at("//form/input[@type='hidden']")["value"]

a.post(post_url + '?' + URI.escape(select_city_name) + '=' + city_code + '&' + URI.escape(hidden_name) + '=' + URI.escape(hidden_value))

# Post Type Input
type_name = a.page.at("//form/blockquote/label[text()[contains(.,'#{type}')]]/input")["name"]
type_id = a.page.at("//form/blockquote/label[text()[contains(.,'#{type}')]]/input")["value"]

hidden_name_1 = a.page.at("//form/input[@type='hidden']")["name"]
hidden_value_1 = a.page.at("//form/input[@type='hidden']")["value"]

a.post(post_url + '?' + type_name + '=' + type_id + '&' + URI.escape(hidden_name_1) + '=' + URI.escape(hidden_value_1))

# Category Type Input
category_name = a.page.at("//form/blockquote/label[text()[contains(.,'#{category}')]]/input")["name"]
category_id = a.page.at("//form/blockquote/label[text()[contains(.,'#{category}')]]/input")["value"]

hidden_name_2 = a.page.at("//form/input[@type='hidden']")["name"]
hidden_value_2 = a.page.at("//form/input[@type='hidden']")["value"]

a.post(post_url + '?' + category_name + '=' + category_id + '&' + URI.escape(hidden_name_2) + '=' + URI.escape(hidden_value_2))

# Area Input
area_name = a.page.at("//form/blockquote/label[text()[contains(.,'#{area}')]]/input")["name"]
area_id = a.page.at("//form/blockquote/label[text()[contains(.,'#{area}')]]/input")["value"]

hidden_name_3 = a.page.at("//form/input[@type='hidden']")["name"]
hidden_value_3 = a.page.at("//form/input[@type='hidden']")["value"]

a.post(post_url + '?' + area_name + '=' + area_id + '&' + URI.escape(hidden_name_3) + '=' + URI.escape(hidden_value_3))

# Listing Input


post_title_name = a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Posting Title:']/parent::div/input")["name"]
post_price_name = a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Price:']/parent::div/input")["name"]
post_location_name = a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Specific Location:']/parent::div/input")["name"]
post_email_name = a.page.at("//form[@id='postingForm']/div/div/div[@class='row']/div/input[@id='FromEMail']")["name"]
post_confirm_email_name = a.page.at("//form[@id='postingForm']/div/div/div[@class='row']/div/input[@id='ConfirmEMail']")["name"]
post_description_name = a.page.at("//form[@id='postingForm']/div/div/textarea")["name"]

hidden_name_4 = a.page.at("//form/input[@type='hidden']")["name"]
hidden_value_4 = a.page.at("//form/input[@type='hidden']")["value"]

a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Posting Title:']/parent::div/input")["value"] = title

a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Price:']/parent::div/input")["value"] = price
a.page.at("//form[@id='postingForm']/div/div/div[@class='title row']/div/span[text()='Specific Location:']/parent::div/input")["value"] = location
a.page.at("//form[@id='postingForm']/div/div/div[@class='row']/div/input[@id='FromEMail']")["value"] = email
a.page.at("//form[@id='postingForm']/div/div/div[@class='row']/div/input[@id='ConfirmEMail']")["value"] = email
a.page.at("//form[@id='postingForm']/div/div/textarea").content = description

a.click(a.page.at("//form[@id='postingForm']/button"))

#puts (post_url + '?' + URI.escape(post_title_name) + '=' + title + '&' + URI.escape(post_price_name) + '=' + price + '&' + URI.escape(post_location_name) + '=' + location + '&' + URI.escape(post_email_name) + '=' + email + '&' + URI.escape(post_confirm_email_name) + '=' + email + '&' + 'post_description_name' + '=' + description + '&' + hidden_name_4 + '=' + hidden_value_4 + '&' + 'id2' + '=' + '1218x262X1218x262X1440x900' + 'go' + '=' + 'Continue')

puts a.page.parser.css('body')
puts a.page.parser.css('title')







