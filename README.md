# Online Bookstore Web
### Introduction
This is a hardening and RESTful online bookstore application. 
The frontend of the web application is built using the Vue framework, and the backend uses mySQL. 
It makes use of the Tomcat server and uses Ajax to update the website's content. 
The web application organizes the contents of the shopping cart using Vuex state management. 
You can purchase books using the online app for the bookshop by adding them to your shopping basket and then checking out. 
Information about the customer, including name, address, phone number, and email, is requested on the checkout page. 
Through Vuelidate and server side validation, the data would be verified according to its format. 
The client and order information would be entered into the database and the shopping cart would be cleared when pressing the complete purchase button.

### Web Link
http://cs5244.cs.vt.edu:8080/YuChingBookstoreTransact/

Link may not be available as it is run on Virginia Tech servers

## Web Appearance and Design
### Homepage
<img width="450" alt="Home" src="https://user-images.githubusercontent.com/39873770/206364480-bb21dfc3-d8bd-4010-a2d0-cd2a88fa1e69.png">

### Category page
<img width="450" alt="Category" src="https://user-images.githubusercontent.com/39873770/206368168-8ea2cd33-dea6-4d46-a3cc-d8335fe89215.png">

### Shopping Cart page
<img width="450" alt="Cart" src="https://user-images.githubusercontent.com/39873770/206620086-5a028418-d1a5-4a4d-a4ce-834f534f70a0.png">

### Checkout page
<img width="450" alt="Checkout" src="https://user-images.githubusercontent.com/39873770/206610655-31b58dba-6d73-420c-95d7-f21cdcb73847.png">

### Confirmation page
<img width="450" alt="Confirmation" src="https://user-images.githubusercontent.com/39873770/206614163-a6f4fe8d-606d-4022-8bda-0ad4c0864e19.png">

## Validation
### Client side
<img width="450" alt="Validation" src="https://user-images.githubusercontent.com/39873770/206617369-89741eb4-4e92-4d7b-9056-01d12adf6fa2.png">
The client-side validation would validate the name, address, phone, email, and credit card information to check if they are in a correct format.

### Server side
In the server side validation, before passing the information to the database, the customer information would be further checked as well as the shopping cart (invalid price, invalid quantity etc.). The server side would clean the customer data and also organize the information format(such as phone xxx-xxx-xxxx is the same as (xxx)xxx-xxxx). If the information is not verified, the purchase cannot be completed, and an error message is returned as a response.

## Hardening
### Not found page
<img width="450" alt="Not found" src="https://user-images.githubusercontent.com/39873770/206621092-dae8dda7-2c93-4030-88d0-dcde476e86b4.png">

The website shows a not found page when customer enters an invalid address in the address bar.
