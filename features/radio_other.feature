Feature: Other Radio option

  In order to select a radio button
  as a site user
  I want the radio group to have male, female, other

  Background:
    Given I am viewing the qa site

  Scenario: Radio button Other
    When I select the "Other" radio button
    Then "Other" should show as selected
