Feature: Invalid login feature
  A verified user should be able to login
  


Scenario: I login with invalid id


    Given I open "http://projecto-m-zainbutt.c9users.io:8080/login"
     And I enter username "wrong_username@gmail.com"
     And I enter password "wrong_password"
     When I click button "signIn"
     Then element having id "errormsg_0_Passwd" should be present
     Then element having id "errormsg_0_Passwd" should have text as "The email or password you entered is incorrect."