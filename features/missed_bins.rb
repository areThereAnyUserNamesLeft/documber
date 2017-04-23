require 'selenium-webdriver'
require 'headless'
headless = Headless.new(display: 100, destroy_at_exit: false)
headless.start


driver = Selenium::WebDriver.for :firefox
wait = Selenium::WebDriver::Wait.new(:timeout => 5) # seconds

Given(/^We navigate to the Missed bin form$/) do
    driver.navigate.to "https://my.southampton.gov.uk/en/AchieveForms/?form_uri=sandbox-publish://AF-Form-a4da2a6c-5bb5-4773-976f-b9e9ae0db95a/definition.json&redirectlink=%2FService%2FServiceRating%3Fserviceid%3DAF-Form-a4da2a6c-5bb5-4773-976f-b9e9ae0db95a%26service%3DR4%26postRatingRedirectUrl%3D%2Fmodule%2Fservices&cancelRedirectLink=%2F&category=AF-Category-9f35cdb7-de98-43db-83aa-aa7c366fc81d&noLoginPrompt=1"
end

When(/^We click the DPA confirmation$/) do
    element = wait.until {driver.find_element(:id => 'fillform-frame-1')}
    driver.switch_to.frame('fillform-frame-1')
    element = wait.until {driver.find_element(:css => '#checkbox1 > span  > input')}
    driver.find_element(:css => '#checkbox1 > span  > input').click
end

Then(/^We see the next button appear$/) do
    begin
        element = wait.until { driver.find_element(:css => 'div > div > button.btn.btn-af.pull-right.nextbutton') }
        expect(element.text).to eq('Next')
    end
end

When(/^We click the next button$/) do
    driver.find_element(:css, 'div > div > button.btn.btn-af.pull-right.nextbutton').click
end

When(/^We see the bin options appear$/) do
        wait.until { driver.find_element(:css => '#requestype > span:nth-child(4) > label') }
end

When(/^We click the household waste option$/) do
    driver.find_element(:css, '#requestype > span:nth-child(4) > label').click
end
When(/^We see the postcode search appear$/) do
    wait.until { driver.find_element(:css => '#postcode_search') }
end

When(/^We enter a valid postcode$/) do
    driver.find_element(:css, '#postcode_search').send_keys('s')
    driver.find_element(:css, '#postcode_search').send_keys('o')
    driver.find_element(:css, '#postcode_search').send_keys('1')
    driver.find_element(:css, '#postcode_search').send_keys('4')
    driver.find_element(:css, '#postcode_search').send_keys(' ')
    driver.find_element(:css, '#postcode_search').send_keys('3')
    driver.find_element(:css, '#postcode_search').send_keys('a')
    driver.find_element(:css, '#postcode_search').send_keys('z')
end

When(/^We see the select box appear$/) do
    wait.until { driver.find_element( :id => 'lookup') }

    addrSelect =  driver.find_element(:id => 'lookup') 
    addrSelect.find_elements(:tag_name => 'option').find do |option|
        option.text == '10A Queensway Southampton SO14 3AZ'
   end.click
end
#ensure
#  headless.destroy
#end
#checkbox1 > span > label
##postcode_search
#<option class="lookup-option" value="100062502273"> 10A Queensway Southampton SO14 3AZ</option>
