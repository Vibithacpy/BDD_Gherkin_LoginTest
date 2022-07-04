Feature: This feature file tests the login feature of website ‘https://wave-trial.getbynder.com/login/’

Background:
    Given User launch chrome browser
	When The user opens the URL https://wave-trial.getbynder.com/login/
    	And the field 'Email/Username' is empty
    	And the field 'password' is empty
  
  @InvalidLogin
  Scenario:Verify Login with empty fields
When User clicks on 'Login' button
Then Error message to enter 'Email/Username' and 'password' should be displayed
And User closes the browser
  
  @InvalidLogin
  Scenario Outline:Verify login with invalid credentials
      When User enters "<Username>" in 'Email/Username'
      And User enters "<Password>" in 'password'
      And User clicks on 'Login' button
      Then Error message 'You have entered an incorrect username or Password.’ Should be displayed      
      And User closes the browser
	
	Examples:
	| Username | Password | 
	|Vibitha | 7K>}N!\~J)=@]Jcp|
	|Vibitha1| 7K>}N!\~J)=@]JcP|
	| admin| admin|
  
  @ValidLogin
  Scenario:Verify successful login and logout using valid credential
   	 When User enters "Vibitha" in 'Email/Username'
  	 And User enters "7K>}N!\~J" in 'password'
   	 And User clicks on 'Login' button
   	 Then Home page should be displayed
	 When The user clicks on logout button from the profile section
	 Then Login page should be launched
	 And User closes the browser
	
  @ValidLogin
  Scenario:Verify successful login and logout using valid credential
       When User enters "Vibitha" in 'Email/Username'
       And User enters "7K>}N!\~J" in 'password'
       And User clicks on 'Login' button
       Then Home page should be displayed
	 When User closes the browser
	 And User launches the URL 'https://wave-trial.bynder.com' 
	 Then Login page should be displayed
	 And User closes the browser
