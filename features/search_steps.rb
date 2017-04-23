require 'selenium-webdriver'
require 'headless'

Headless.new(display: 100, reuse: true).start

driver = Selenium::WebDriver.for :firefox

Given(/^We navigate to the google$/) do
  driver.navigate.to "https://www.google.co.uk/"
end

When(/^We search for the word agile$/) do
  driver.find_element(:id, 'lst-ib').send_keys("agile")
  driver.find_element(:id, 'lst-ib').send_keys("\n")
end

Then(/^The results for the search will be displayed$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds
  begin
    element = wait.until { driver.find_element(:css => "div._NId:nth-child(2) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > div:nth-child(1) > h3:nth-child(1) > a:nth-child(1)") }
    expect(element.text).to eq('Agile software development - Wikipedia')
  ensure
    driver.quit
  end
end
