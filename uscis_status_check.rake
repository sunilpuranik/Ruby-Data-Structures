#*/10 * * * * /bin/bash -l -c 'cd /home/puranisu/My_agile_32 && RAILS_ENV=development xvfb-run rake email_uscis_status --silent'

task :email_uscis_status => :environment do 

	require "rubygems" 
	require "selenium-webdriver"
	driver = Selenium::WebDriver.for :firefox
	driver.navigate.to "https://egov.uscis.gov/casestatus/landing.do"
	
	rec = driver.find_element(:id , "receipt_number")
	rec.send_keys "LIN1719150879"

	subm = driver.find_element(:name, "initCaseSearch")
	subm.click

	SuccessMessage = driver.find_element(:xpath, "/html/body/div[2]/form/div/div[1]/div/div/div[2]/div[3]/h1")

	StatusText =  SuccessMessage.text

	if StatusText != 'Case Was Received'
		Mailer.mail_message('sunil.puranik@bio-techne.com', 'Status Change', StatusText, 'NoReply@PDPT.rndsystems.com')
	end

	driver.quit

end

