Feature: Auto index page

  Scenario: Create index file in directories that have "index.html"
    Given a fixture app "drawer-app"
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should exist:
      | build/index.html                          |
      | build/empty_dir/index.html                |
      | build/empty_dir/sub_empty_dir/index.html  |
      | build/empty_dir/sub_empty_dir/sample.html |
      | build/not_empty_dir/index.html            |
    And the file "build/index.html" should contain "Proxy Template"
    And the file "build/empty_dir/index.html" should contain "Proxy Template"
    And the file "build/empty_dir/sub_empty_dir/index.html" should contain "Proxy Template"
    And the file "build/empty_dir/sub_empty_dir/sample.html" should contain "Sample"
    And the file "build/not_empty_dir/index.html" should contain "Not Empty"

  Scenario: Create index file in directories that have "index.html" without "build/index.html"
    Given a fixture app "drawer-app"
    And a file named "source/index.html.erb" with:
      """
      <h1>Root Index</h1>
      """
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should exist:
      | build/index.html                          |
    And the file "build/index.html" should contain "Root Index"

  Scenario: Don't create index file in default exclude directories
    Given a fixture app "drawer-app"
    When I run `middleman build`
    Then the exit status should be 0
    And the following files should not exist:
      | build/images/index.html       |
      | build/stylesheets/index.html  |
      | build/javascripts/index.html  |
      | build/layouts/index.html      |
      | build/templates/index.html    |
