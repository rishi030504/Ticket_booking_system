# Ticket_booking_system

A simple SQL-based Ticket Booking System project that demonstrates database creation, seat booking, transactions, row locking, and concurrency control using MySQL.

This project simulates how real-world movie or event booking systems prevent multiple users from booking the same seat simultaneously.

---

# 📌 Features

- User Management
- Movie Show Management
- Seat Availability Tracking
- Ticket Booking
- Transaction Management
- Row-Level Locking using `FOR UPDATE`
- Booking History
- Concurrency Control

---

# 🛠 Technologies Used

- MySQL
- SQL Transactions
- DBMS Concepts

---

# 📂 Database Tables

## 1. Users
Stores user information.

```sql
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);
