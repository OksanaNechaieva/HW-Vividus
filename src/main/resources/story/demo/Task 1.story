Scenario: Navigate to the EPAM website homepage
Given I am on main application page
Then `${current-page-url}` is equal to `https://www.epam.com/`

Scenario:Check the title is correct
Then page title is equal to `EPAM | Software Engineering & Product Development Services`

Scenario: Check the ability to switch Light / Dark mode
When I ESTABLISH baseline with name `loginPage`
When I hover mouse over element located `className(theme-switcher)`
Then text `Dark Mode` exists
When I click on element located by `className(theme-switcher)`
When I ${baselineAction} baseline with name `loginPage` ignoring:
|ACCEPTABLE_DIFF_PERCENTAGE	|
|75                        |
When I hover mouse over element located `className(theme-switcher)`
Then text `Light Mode` exists

Scenario:Check that allow to change language to UA
When I click on element located by `className(location-selector__button-language)`
When I take screenshot
Then text `Україна` exists
When I click on element located by `name(Україна)`
Then `${current-page-url}` is equal to `https://careers.epam.ua/`
When I navigate back


Scenario: Check the policies list
When I scroll element located by `className(policies)` into view
Then text `<text>` exists
Examples:
|text|
|INVESTORS|
|COOKIE POLICY|
|OPEN SOURCE|
|APPLICANT PRIVACY NOTICE|
|PRIVACY POLICY|
|WEB ACCESSIBILITY|

Scenario: Check location list
When I scroll element located by `className(museo-sans-light)` into view
Then text `<locations>` exists
Examples:
|locations|
|AMERICAS|
|EMEA|
|APAC|

Scenario: Check that allow to switch location list by region
When I click on element located by `name(EMEA)`
When I click on element located by `name(APAC)`
When I click on element located by `name(AMERICAS)`

Scenario: Check the search function
When I click on element located by `className(search-icon)`
When I enter `AI` in field located by `id(new_form_search)`
When I click on element located by `className(custom-search-button)`
Then `${current-page-url}` is equal to `https://www.epam.com/search?q=AI`
When I navigate back

Scenario: Check form's fields validation
When I click on element located by `name(CONTACT US)`
Then `${current-page-url}` is equal to `https://www.epam.com/about/who-we-are/contact`
When I save `aria-required` attribute value of element located `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_first_name)` to STORY variable `firstname`
Then `${firstname}` is equal to `true`
When I save `aria-required` attribute value of element located `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_last_name)` to STORY variable `lastname`
Then `${lastname}` is equal to `true`
When I save `aria-required` attribute value of element located `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_email)` to STORY variable `email`
Then `${email}` is equal to `true`
When I save `aria-required` attribute value of element located `id(_content_epam_en_about_who-we-are_contact_jcr_content_content-container_section_section-par_form_constructor_user_phone)` to STORY variable `phone`
Then `${phone}` is equal to `true`



Scenario: Check that the Company logo on the header lead to the main page
When I go to relative URL `https://www.epam.com/about`
When I click on element located by `imageSrc(/content/dam/epam/homepage/epam_logo_light.svg)`
Then `${current-page-url}` is equal to `https://www.epam.com/`
