# Electricity-Bill-Management-System
This project is a web-based Electricity Billing System that provides consumers with an easy and secure way to view, pay, and manage their electricity bills online. It also allows interaction with electricity providers for complaints, queries, and support.

# Features

- User Registration & Login

- Secure Consumer Dashboard

- Bill Generation & Viewing

- Online Bill Payment (Simulated/Integrated depending on setup)

- Billing History Tracking

- Complaint & Query Management

- Admin Dashboard for Providers (Manage consumers, payments, and queries)

 # Technologies Used

- Frontend: HTML, CSS, Bootstrap, JavaScript

- Backend: PHP

- Database: MySQL

- Server: Apache (XAMPP/WAMP recommended)

# Project Structure
- ElectricityBillingSystem/
│── assets/            # CSS, JS, and images
│── config/            # Database connection files
│── includes/          # Reusable PHP files (header, footer, session, etc.)
│── pages/             # User and Admin pages
│── index.php          # Home / Login page
│── signup.php         # User registration
│── dashboard.php      # User dashboard
│── admin/             # Admin dashboard
│── database.sql       # Database schema
│── README.md          # Project documentation

# Installation & Setup
Prerequisites

Install XAMPP
 or WAMP
.

Enable Apache and MySQL modules.

Steps

Clone or download this repository.

git clone https://github.com/DivineGankui/ebill.git


Move the project folder to your server’s root directory:

For XAMPP: htdocs/

For WAMP: www/

Import the database.sql file into MySQL using phpMyAdmin.

Update the config/config.php file with your database credentials:

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "ebill";


Open a browser and go to:

http://localhost/ebill/

🔑 Default Login Credentials

Admin

Email: divinegankui743@gmil.com

Password: Experience@743

User

Register a new account using signup.php

# Future Improvements

- Integration with Mobile Money / Payment APIs

- SMS / Email bill reminders

- Data visualization with charts

- Multi-language support

# Author

[Divine Kojo Gankui]

Email: divinegankui743@gmail.com

GitHub: DivineGankui
