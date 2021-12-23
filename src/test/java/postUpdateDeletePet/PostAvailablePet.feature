@tag
Feature: POST an Available Pet using POST

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
  Scenario: POST Available Pet status 200
    * configure retry = { count: 12, interval: 3000 }
    * def randomName =
      """
      function(s) {
      		//returns a set of randomly generated characters and numbers, pre-defined with TestM
           var text = "";
           var possible = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890'";
           for (var i = 0; i < s; i++)
           text += possible.charAt(Math.floor(Math.random() * possible.length));
           return 'TestM' + text;
       }
      """
    * def name =  randomName(10)
    Given url baseUrl
    And path 'pet'
    And request {name: '#(name)', photoUrls:['testURL'], status:'available'}
    When method post
    Then status 200
    And match $ contains {id: '#number', name: '#(name)'}
    * def id = $.id
    And print id
    Given path 'pet', id
    And request {petId: '#(id)'}
    And retry until response.status == 'available'
    When method get
    Then status 200
    And match $ contains {id: '#(id)', status: 'available'}
    * def id = call read('UpdatePetStatus.feature') {id: '#(id)'}
