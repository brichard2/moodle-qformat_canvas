@qformat @qformat_canvas
Feature: Test importing questions from Canvas XML format.
  In order to reuse questions made in the Canvas LMS
  As an teacher
  I need to be able to import them in the Canvas XML format.

  Background:
    Given the following "courses" exist:
      | fullname | shortname | format |
      | Course 1 | C1        | topics |
    And the following "users" exist:
      | username | firstname |
      | teacher  | Teacher   |
    And the following "course enrolments" exist:
      | user    | course | role           |
      | teacher | C1     | editingteacher |
    And I log in as "teacher"
    And I am on "Course 1" course homepage

  @javascript @_file_upload
  Scenario: import some Canvas questions
    When I navigate to "Question bank > Import" in current page administration
    And I set the field "id_format_canvas" to "1"
    And I upload "question/format/canvas/tests/fixtures/canvas_matching_question.xml" file to "Import" filemanager
    And I press "id_submitbutton"
    Then I should see "Parsing questions from import file."
    And I should see "Importing 2 questions from file"
    And I should see "What color is an elephant?"
    And I should see "What happens when it rains?"
    When I press "Continue"
    Then I should see "What color is an elephant"
