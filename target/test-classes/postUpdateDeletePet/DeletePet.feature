@ignore
@tag
Feature: Delete Pet using DELETE

  @tag1
  Scenario: Delete Pet 200
    * configure retry = { count: 12, interval: 3000 }
    * def id = id
    Given url baseUrl
    And path 'pet', id
    And request {petId: '#(id)'}
    When method delete
    Then status 200
    And assert response.message == id
    Given path 'pet', id
    And request {petId: '#(id)'}
    And retry until response.code > 0
    When method get
    Then status 404
    And match $ contains {code: #number, type: '#string', message: 'Pet not found'}
