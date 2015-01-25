Feature: Template CLI

  Scenario: Create a new project
    Given I run `middleman init MY_PROJECT --template tansu`
    And the exit status should be 0
    When I cd to "MY_PROJECT"
    Then the following files should exist:
      | Gemfile                                |
      | .gitignore                             |
      | config.rb                              |
      | source/layouts/layout.slim             |
      | source/stylesheets/all.css.sass        |
      | source/stylesheets/github-markdown.css |
      | source/templates/index.html.slim       |

  Scenario: Build a new project
    Given I run `middleman init MY_PROJECT --template tansu`
    And I cd to "MY_PROJECT"
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should exist:
      | build/index.html                       |
      | build/stylesheets/all.css              |

