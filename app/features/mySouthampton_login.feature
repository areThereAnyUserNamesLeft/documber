Feature: Login to mySouthampton
Scenario: Logging in with valid details  
  Given We navigate to the mySouthampton login page
  When We enter a valid user name and password and click 'Sign in' button 
  Then We see our user name in the top right hand corner

Scenario: Logging in without valid details
  Given We again navigate to the mySouthampton login page
  When We enter an invalid user name and password and click 'Sign in' button 
  Then We see 'Log in failed'
