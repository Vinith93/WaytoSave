require 'selenium-webdriver'

@driver = Selenium::WebDriver.for :firefox
@driver.manage.window.maximize
@driver.navigate.to "https://www.fb.com"
@driver.find_element(id: "email").send_keys("ssvinith@gmail.com")
@driver.find_element(id: "pass").send_keys("vignesh@fb.com")

wait = Selenium::WebDriver::Wait.new(:timeout => 5)
begin
 element = wait.until {@driver.find_element(id: "u_0_5").click}
ensure
	@driver.quit
end


#Instaclled geckodriver and extract here and mv the extracted file to /usr/local/bin where the executable files are available 