Scenario: Navigate to the EPAM website homepage
Given I am on main application page
Then `${current-page-url}` is equal to `https://www.epam.com/`

Scenario:Check the title is correct
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch Light / Dark mode
When I ESTABLISH baseline with name `loginPage`
When I click on element located by `className(theme-switcher)`
When I ${baselineAction} baseline with name `loginPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|75                        |


