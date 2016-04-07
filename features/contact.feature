Feature: display list of movies filtered by MPAA rating
 
  As a concerned parent
  So that I can quickly browse movies appropriate for my family
  I want to see movies matching only certain MPAA ratings

Background: courses have been added to database

  Given the following courses exist:
  | title                       | rating | Instructor   |
  | Introduction to Programming | 4/5    | Zain Butt    |
  | Data Structures             | 4.5/5  | Ozair Asim   |
  | Discrete Mathematics        | 4.25/5 | Mahnoor Ejaz |
  | Algorithms                  | 4/5    | Mujtaba Ali  |
  | Computer Graphics           | 4.4/5  | Fnu Tulha    |
  | Software Engineering        | 4.5/5  | Fahad Cheema |
  | Computer Networks           | 5/5    | Moiz Imran   |

  And I open "http://projecto-m-zainbutt.c9users.io:8080/courses"

Scenario: same courses
  When  "refresh"
  Then I should see "Algorithms" before "Computer Graphics"
#your steps here

Scenario: same instructors
  When I press "refresh"
  Then I should see "Zain Butt" before "Ozair Asim" 