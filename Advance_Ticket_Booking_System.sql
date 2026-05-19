create database Ticket;
use Ticket;
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Shows (
    show_id INT PRIMARY KEY AUTO_INCREMENT,
    movie_name VARCHAR(100),
    show_time DATETIME
);

CREATE TABLE Seats (
    seat_id INT PRIMARY KEY AUTO_INCREMENT,
    show_id INT,
    seat_number VARCHAR(10),
    status ENUM('AVAILABLE', 'BOOKED') DEFAULT 'AVAILABLE',
    version INT DEFAULT 1,

    FOREIGN KEY (show_id) REFERENCES Shows(show_id)
);

CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    seat_id INT,
    booking_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('SUCCESS', 'FAILED'),

    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (seat_id) REFERENCES Seats(seat_id)
);

INSERT INTO Users(name, email)
VALUES
('Prachi', 'prachi@gmail.com'),
('Rahul', 'rahul@gmail.com');

INSERT INTO Shows(movie_name, show_time)
VALUES
('Avengers', '2026-05-20 18:00:00');

INSERT INTO Seats(show_id, seat_number)
VALUES
(1, 'A1'),
(1, 'A2'),
(1, 'A3');

SELECT * FROM Users;
SELECT * FROM Shows;
SELECT * FROM Seats;

START TRANSACTION;

SELECT *
FROM Seats
WHERE seat_id = 1
FOR UPDATE;

UPDATE Seats
SET status = 'BOOKED'
WHERE seat_id = 1;

INSERT INTO Bookings(user_id, seat_id, status)
VALUES (1, 1, 'SUCCESS');

COMMIT;

SELECT * FROM Seats;
SELECT * FROM Bookings;