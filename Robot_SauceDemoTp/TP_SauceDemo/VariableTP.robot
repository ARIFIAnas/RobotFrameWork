*** Variables ***

${browser}    chrome
${url}    https://www.saucedemo.com/
${username}    standard_user
${locked_username}    locked_out_user    
${password}    secret_sauce
${product_url}    https://www.saucedemo.com/inventory.html
${TITLE_XPATH}  //span[@data-test='title']
${EXPECTED_TITLE}  Products
${list_sort}    hilo
${ADD_TO_CART_XPATH}  //div/button[text()="Add to cart"]
${cart_url}    https://www.saucedemo.com/cart.html
${fname}    Cristiano
${lname}    Ronaldo
${zcode}    20000
${checkout_url}    https://www.saucedemo.com/checkout-step-one.html
${confirm_url}    https://www.saucedemo.com/checkout-step-two.html
${complete_url}    https://www.saucedemo.com/checkout-complete.html
${price_element}    .inventory_item_price
@{prices}       49.99     29.99    15.99    15.99    9.99    7.99
@{pricesLH}    7.99    9.99    15.99    15.99    29.99    49.99        
${title}    Sauce Labs Bike Light
${description}    A red light isn't the desired state in testing but it sure helps when riding your bike at night. Water-resistant with 3 lighting modes, 1 AAA battery included.
${prix}    $9.99                              