# Netopia - Employees Management

Netopia is an employee management system designed to streamline HR processes and enhance organizational efficiency. This README provides comprehensive instructions for setting up the project environment, installing dependencies, and importing the necessary database.

## Prerequisites

Before commencing the setup, ensure you have the following prerequisites in place:

* **MySQL Server:** A functional MySQL server instance.
* **Python 3.10.12:** Python version 3.10.12 installed on your system.

## Installation

***Install System Dependencies***

These packages are required for the MySQL Python connector

`sudo apt update`

`sudo apt install pkg-config libmysqlclient-dev`


***Set Up Database***

Connect to your MySQL server using the following command, replacing user with your MySQL username and providing the corresponding password when prompted:

`mysql -u user -p`


***Create the Database***

Once connected, execute the following command to create the database named django_netopia:

`CREATE DATABASE django_netopia;`

`EXIT;`


***Import Database Schema***

Use the following command to import the database schema from the netopia_django_with_proc_dump.sql file, replacing user with your username:

`mysql -u user -p django_netopia < netopia_django_with_proc_dump.sql`


***Create Virtual Environment***

To isolate project dependencies, create a virtual environment:

`python3 -m venv netopia_env`

`source netopia_env/bin/activate`


***Install Project Dependencies***

Install the required packages from the requirements.txt file:

`pip install -r requirements.txt`


***Start the Development Server***

Run the following command to start the development server:

`python manage.py runserver 0.0.0.0:8000`

***Access application on your browser***

http://localhost:8000
