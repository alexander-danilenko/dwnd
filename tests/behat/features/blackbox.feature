@blackbox
Feature: Basic validation
  In order to prove Drupal was installed properly
  As a developer
  I need to use the step definitions of this context

  Scenario: Open home page and find text
    Given I am on the homepage
    Then I should see "Powered by Drupal" in the "#block-system-powered-by" element
