# gsl_task


This project is built using Flutter with GetX for state management and follows the MVVM (Model-View-ViewModel) architecture pattern to ensure clean and maintainable code.

# Getting started

This project is based on Dart 3.3.3 and build for Android and iOS

# Features
Ticket List
Tickets Filter
Contacts List
User Profile
Logout

# Architecture

In this project MVVM architecture has been followed by GetX for state management. Hence flutter ephemeral state and app state could be used but GetX has been used for future feature development. 

The project index based directory is created such as :
<img width="814" alt="Screenshot 2025-03-20 at 12 13 12 PM" src="https://github.com/user-attachments/assets/af356760-3cc7-454a-ad64-c7bad34f38fb" />


# Implementation approaches
In this project no api call has been done but it simulates api call methods on viewmodel files. There are  json files for respected data which have been stored in assets. It stores data as a json object we get from pai response. By procession it converts json to dart object using best practices and storing it to model file in GetX observable variables and showing it to ui when changes. 

The ui has been developed as Modular approaches like Separation of Concerns (SoC) and Reusable components. Unnecessary rebuilding of state has been invoked using const. 

The business logic and api calling has been done on viewmodel and it is the only responsible file for this type of work. And the viewmodel has been registered as an instance by using dependency injection of Getx. Get.put() instantiates and stores it in memory. It 

Model file has been used for storing data and handles data by observable and showing the update data in ui.



