@tag
Feature: GET List of available Pets using GET

  @tag1
  Scenario: GET all available pets status 200
    Given url baseUrl
    And path 'pet/findByStatus'
    And param status = 'available'
    When method get
    Then status 200
    And match each $ contains {id: '#number', name: '#string', status: 'available'}

  @tag2
  Scenario: GET all available pets status 200 empty response
    Given url baseUrl
    And path 'pet/findByStatus'
    And param status = 'availabl'
    When method get
    Then status 200
    And match $ == []

  @tag3
  Scenario: GET all available pets status 200 empty response
    Given url baseUrl
    And path 'pet/findByStatus'
    And param statu = 'available'
    When method get
    Then status 200
    And match $ == []
