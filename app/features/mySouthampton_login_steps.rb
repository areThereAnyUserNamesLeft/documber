require 'selenium-webdriver'
require 'headless'
Headless.new(display: 100, reuse: true).start
driver = Selenium::WebDriver.for :firefox

Given(/^We navigate to the mySouthampton login page$/) do
    driver.navigate.to "https://my.southampton.gov.uk/login/"
end
  When (/^We enter a valid user name and password and click \'Sign in\' button$/) do
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[1]/div/input').send_keys("southamptontester@gmail.com")
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[2]/div/input').send_keys("t3st3r2016")
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[3]/button').click
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[3]/button').click
  end 
  Then (/^We see our user name in the top right hand corner$/) do
      wait = Selenium::WebDriver::Wait.new(:timeout => 9) # seconds
    begin
        driver.switch_to().default_content();
        element = wait.until { driver.find_element(:xpath, '//*[@id="session-badge"]/li/a/span[1]') }
        expect(element.text).to eq('southamptontester@gmail.com')
        element.click
        element = wait.until { driver.find_element(:xpath, '//*[@id="logoutLink"]') }
        driver.find_element(:xpath, '//*[@id="logoutLink"]').click
   # ensure
    #    driver.quit
    end
end

# driver = Selenium::WebDriver.for :firefox

Given (/^We again navigate to the mySouthampton login page$/) do
    driver.navigate.to "https://my.southampton.gov.uk/login/"
end
    When (/^We enter an invalid user name and password and click \'Sign in\' button$/) do
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[1]/div/input').send_keys("invalidaddress@gmail.com")
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[2]/div/input').send_keys("invalidPassword")
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[3]/button').click
      driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/form/div[3]/button').click
    end
    Then (/^We see \'Log in failed\'$/) do
      wait = Selenium::WebDriver::Wait.new(:timeout => 9) # seconds
    begin
        driver.switch_to().default_content();
        element = wait.until { driver.find_element(:xpath, '//*[@id="self-content"]/div/div/div/div/p[1]/b') }
        expect(element.text).to eq('Log in failed')
    ensure
        driver.quit
    end
end
