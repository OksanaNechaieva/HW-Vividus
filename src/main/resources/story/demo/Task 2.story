Scenario: Navigate to the website homepage
Given I am on main application page
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/`

Scenario: Verify that allows register a User
When I click on element located by `className(ico-register)`
When I select a radio button with the name 'Female'
When I enter `#{generate(Name.firstName)}` in field located by `id(FirstName)`
When I enter `#{generate(Name.lastName)}` in field located by `id(LastName)`
When I enter `#{generate(examplify 'teyaxe5138@pofmagic.com')}` in field located by `id(Email)`
When I enter `Paw0rdPa55w0rd` in field located by `id(Password)`
When I enter `Paw0rdPa55w0rd` in field located by `id(ConfirmPassword)`
When I take screenshot
When I click on element located by `id(register-button)`
When I take screenshot
When I click on element located by `className(ico-logout)`

Scenario: Verify that allows login a User
When I click on element located by `className(ico-login)`
When I enter `teyaxe5138@pofmagic.com` in field located by `id(Email)`
When I enter `Paw0rdPa55w0rd` in field located by `id(Password)`
When I click on element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[2]/div/div[2]/div[1]/div[2]/div[2]/form/div[5]/input)`
When I take screenshot

Scenario: Verify that ‘Computers’ group has 3 sub-groups with correct names
When I click on element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[1]/div[1]/div[2]/ul/li[2]/a)`
Then number of elements found by `className(sub-category-item)` is equal to `3`
When I save text of element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]/div[1]/div/h2/a)` to STORY variable `Desktops`
Then `${Desktops}` is equal to `Desktops`
When I save text of element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]/div[2]/div/h2/a)` to STORY variable `Notebooks`
Then `${Notebooks}` is equal to `Notebooks`
When I save text of element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]/div[3]/div/h2/a)` to STORY variable `Accessories`
Then `${Accessories}` is equal to `Accessories`

Scenario: Verify sorting dropdown elements
When I click on element located by `xpath(/html/body/div[4]/div[1]/div[4]/div[2]/div[2]/div[2]/div[1]/div[1]/div/h2/a)`
Then dropdown located by `id(products-orderby)` contains options:
|state|item |
|true|Position  |
|false|Name: A to Z|
|false |Name: Z to A |
|false |Price: Low to High |
|false |Price: High to Low |
|false |Created on |
Then dropdown located by `id(products-pagesize)` contains options:
|state|item |
|false|4  |
|true|8|
|false |12|
Then dropdown located by `id(products-viewmode)` contains options:
|state|item |
|true|Grid  |
|false|List|

Scenario: Verify that allows sorting items
When I select `Name: Z to A` in dropdown located by `id(products-orderby)`
When I select `Created on` in dropdown located by `id(products-orderby)`
When I select `Price: Low to High` in dropdown located by `id(products-orderby)`
When I select `4` in dropdown located by `id(products-pagesize)`
When I select `12` in dropdown located by `id(products-pagesize)`
When I select `List` in dropdown located by `id(products-viewmode)`

Scenario: Verify that allows changing number of items on page
When I click on element located by `xpath(/html/body/div[4]/div[1]/div[2]/ul[1]/li[4]/a)`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/apparel-shoes`
When I select `4` in dropdown located by `id(products-pagesize)`
Then number of elements found by `className(item-box)` is equal to `4`
When I select `8` in dropdown located by `id(products-pagesize)`
Then number of elements found by `className(item-box)` is equal to `8`
When I select `12` in dropdown located by `id(products-pagesize)`
Then number of elements found by `className(item-box)` is equal to `12`

Scenario: Verify that allows adding an item to the Wishlist
When I click on element located by `xpath((//div[@class='product-item'])[1]//div[@class='picture']//a)`
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/50s-rockabilly-polka-dot-top-jr-plus-size`
When I click on element located by `id(add-to-wishlist-button-5)`
When I save text of element located by `className(wishlist-qty)` to STORY variable `wishlist-qty`
Then `${wishlist-qty}` is equal to `(1)`
When I click on element located by `className(wishlist-qty)`
Then number of elements found by `className(product)` is equal to `1`
When I enter `0` in field located by `xpath((//td[@class='qty nobr'])[1]//input)`
When I click on element located by `name(updatecart)`
When I navigate back
When I navigate back


Scenario: Verify that allows adding an item to the card
When I click on element located by `id(add-to-cart-button-5)`
When I navigate back
When I click on element located by `xpath((//div[@class='product-item'])[2]//div[@class='picture']//a)`
When I click on element located by `id(add-to-cart-button-28)`
When I save text of element located by `className(cart-qty)` to STORY variable `cart-qty`
Then `${cart-qty}` is equal to `(2)`
When I click on element located by `id(topcartlink)`

Scenario: Verify that allows removing an item from the card
When I enter `0` in field located by `xpath((//td[@class='qty nobr'])[1]//input)`
When I click on element located by `name(updatecart)`

Scenario: Verify that allows checkout an item
When I check checkbox located by `id(termsofservice)`
When I click on element located by `id(checkout)`
When I select `Bahrain` in dropdown located by `id(BillingNewAddress_CountryId)`
When I enter `#{generate(Address.city)}` in field located by `id(BillingNewAddress_City)`
When I enter `#{generate(Address.streetAddress)}` in field located by `id(BillingNewAddress_Address1)`
When I enter `#{generate(Address.zipCode)}` in field located by `id(BillingNewAddress_ZipPostalCode)`
When I enter `#{generate(PhoneNumber.cellPhone)}` in field located by `id(BillingNewAddress_PhoneNumber)`
When I click on element located by `xpath(//*[@id='billing-buttons-container']//input)`
When I click on element located by `xpath(//*[@id='shipping-buttons-container']//input)`
When I click on element located by `xpath(//*[@id='shipping-method-buttons-container']//input)`
When I click on element located by `xpath(//*[@id="payment-method-buttons-container"]//input)`
When I click on element located by `xpath(//*[@id="payment-info-buttons-container"]//input)`
When I click on element located by `xpath(//*[@id="confirm-order-buttons-container"]//input)`
When I take screenshot
Then `${current-page-url}` is equal to `https://demowebshop.tricentis.com/checkout/completed/`

Scenario:Delete address
When I click on element located by `xpath(//*[@href="/customer/addresses"])`
When I click on element located by `xpath(//div[@class='buttons']//input[last()])`
When I ACCEPT alert with message which is equal to `Are you sure?`
