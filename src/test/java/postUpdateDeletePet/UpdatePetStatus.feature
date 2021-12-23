@ignore
@tag
Feature: Update Available Pet status using POST

  Background: Configure the wait function
    * configure afterScenario =
      """
      function() {
      // load java type into js engine
      var Thread = Java.type('java.lang.Thread');
      Thread.sleep(3000); // sleep for 3 Seconds
      }
      """

  @tag1
  Scenario: Update Available Pet status to Sold 200
    * def id = id
    Given url baseUrl
    And path 'pet'
    And request {petId: '#(id)', status:'sold'}
    When method post
    Then status 200
    And assert response.id == id
    And match $ contains {status: 'sold'}
    * def id =  call read('DeletePet.feature') {id: '#(id)'}
