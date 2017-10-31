require 'selenium-webdriver'

Given(/^I navigate to fb$/) do
	@driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.maximize
    @driver.navigate.to "https://www.fb.com"
end