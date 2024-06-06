*** Settings ***
Library    SeleniumLibrary
Resource    KeywordsTP.robot
Library    Collections

*** Test Cases ***
Test1 - Login and logout with username and password valid

    openUrl    ${url}    ${browser}
    Given I am on the Login page    ${username}    ${password}
    When I am on the product page  ${product_url}
    Element Text Should Be    ${TITLE_XPATH}  ${EXPECTED_TITLE}
    Then I Logout from the user
    And I Verify that I loged out    expected_url=${url}

Test2 - Login with locked account
    
    Open url    ${url}    ${browser}
    Given I am on the Login page    ${locked_username}    ${password}
    Element Should Be Visible    //h3[@data-test="error"]

Test3 - Navigate in sauce demo
    OpenUrl    ${url}    ${browser}
    Given I am on the Login page    ${username}    ${password}
    When I sort the product list from highest to lowest price    ${list_sort}
    Then I add the first two products to the cart
    And And I go to cart    ${cart_url}
    And I check that I have two products in the basket
    And I enter the customer information firstname and lastname and zipcode    ${fname}    ${lname}    ${zcode}
    And I finalize the order

Test4 - Exercice 4
    Open url     ${url}    ${browser}
    Given I am on the Login page    ${username}    ${password}
    When I sort the product list from highest to lowest price    ${list_sort}
    Then Compare prices high to low
    Then Compare prices low to high

Test5 - Cas de Test 5
    Open url    ${url}    ${browser}     
    Given I am on the Login page    ${username}    ${password}
    Then I want the 2 item    ${title}    ${description}    ${prix}


    
