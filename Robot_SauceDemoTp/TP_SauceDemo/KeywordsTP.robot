*** Settings ***
Library    SeleniumLibrary
Library    collections
Resource    VariableTP.robot

*** Keywords ***
Open url
    [Arguments]    ${url}   ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
I am on the Login page 
    [Arguments]    ${username}    ${password}
    Input Text    id=user-name    ${username}
    Input Password   id=password   ${password}
    Click Element    id=login-button
I am on the product page
    [Arguments]  ${expected_url}
    ${current_url}=  Get Location
    Should Be Equal  ${current_url}  ${expected_url}
I Logout from the user
    Click Element    id=react-burger-menu-btn
    Sleep    3
    Click Element    //a[@id="logout_sidebar_link"] 
I Verify that I loged out
    [Arguments]     ${expected_url}
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}
    Close Browser
I sort the product list from highest to lowest price
    [Arguments]    ${sort_list}
    Select From List By Value    //select[@data-test="product-sort-container"]    ${sort_list}
    Element Text Should Be    //span[@class="active_option"]    Price (high to low)
I add the first two products to the cart
    ${products_links}=  Get WebElements  xpath=${ADD_TO_CART_XPATH}
    Length Should Be  ${products_links}  6
    Click Element  ${products_links[0]}
    Click Element  ${products_links[1]}
    Sleep    3
I go to cart
    [Arguments]     ${expected_url}
    Click Element   //div[@id="shopping_cart_container"]
    ${current_url}=    Get Location
    Should Be Equal    ${current_url}    ${expected_url}
I check that I have two products in the basket
     Element Should Contain    //span[@data-test="shopping-cart-badge"]    2
     Element Text Should Be    //a[@id="item_5_title_link"]    Sauce Labs Fleece Jacket  
     Element Text Should Be    //a[@id="item_4_title_link"]    Sauce Labs Backpack  
        
I enter the customer information firstname and lastname and zipcode
    [Arguments]    ${firsname}    ${lastname}    ${zipcode}    
    Click Element    id=checkout
    Location Should Be    ${checkout_url}   
    Input Text    id=first-name    ${firsname}
    Input Text    id=last-name    ${lastname}
    Input Text    id=postal-code    ${zipcode}
    Sleep    3

I finalize the order
    Click Element    id=continue
    Location Should Be    ${confirm_url}
    Element Text Should Be    //span[@class="title"]    Checkout: Overview        
    Element Text Should Be    //div[@data-test="shipping-info-label"]    Shipping Information:   
    Click Element    id=finish
    Location Should Be    ${complete_url}
    Element Text Should Be    //span[@class="title"]    Checkout: Complete!
    Element Should Be Visible        id=checkout_complete_container    Thank you for your order!
    Element Should Be Visible    id=back-to-products    Back Home

Compare prices high to low 
    @{listeVide}    Create List
    FOR    ${index}     IN RANGE     1    7
        ${element}=    Get Text   (//div[@class="inventory_item_price"])[${index}]
        Append To List    ${listeVide}    ${element.strip('$')}
    END
    Log    ${listeVide}
 
    Should be Equal   ${listeVide}    ${prices}

Compare prices low to high
    Select From List By Value    //select[@data-test="product-sort-container"]    lohi
    @{list}    Create List
    FOR    ${index}     IN RANGE     1    7
        ${element}=    Get Text   (//div[@class="inventory_item_price"])[${index}]
        Append To List    ${list}    ${element.strip('$')}
    END
    Log    ${list}
    Should be Equal   ${list}    ${pricesLH}

I want the 2 item
    [Arguments]    ${titre}    ${desc}    ${tagPrice}
    Click Element    id=item_0_title_link
    #verify Elements
    Element Should Be Visible    id=add-to-cart
    Element Text Should Be    //*[contains(text(), "Sauce Labs Bike Light")]    ${titre}
    Element Should Contain    //*[@data-test="inventory-item-desc"]    ${desc}           
    Element Should Contain    //*[@class="inventory_details_price"]    ${tagPrice}
    Element Should Be Visible    //*[@class="inventory_details_img"]
    #Add to cart
    Click Element    id=add-to-cart
    Element Text Should Be    class=shopping_cart_badge    1
    Click Element    class=shopping_cart_badge
    Element Should Contain    class=inventory_item_name    ${titre}
    Element Should Be Visible    id=remove-sauce-labs-bike-light
    Element Should Contain    class=cart_quantity    1                            




           

    
    


