USE hotel_reservation_system;

CREATE TABLE IF NOT EXISTS guests(
    guest_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS room_types(
    room_type_id INT AUTO_INCREMENT PRIMARY KEY,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(255),
    price_per_night DECIMAL(10,2) NOT NULL,
    capacity INT NOT NULL
);

CREATE TABLE IF NOT EXISTS rooms(
    room_id INT AUTO_INCREMENT PRIMARY KEY,
    room_number VARCHAR(10) NOT NULL UNIQUE,
    room_type_id INT NOT NULL,
    floor_number INT,
    room_status VARCHAR(20) DEFAULT 'Available',
    FOREIGN KEY(room_type_id)
      REFERENCES room_types(room_type_id)
);

CREATE TABLE IF NOT EXISTS bookings(
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    guest_id INT NOT NULL,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    booking_status VARCHAR(20) DEFAULT 'Pending',
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(guest_id)
      REFERENCES guests(guest_id),
    CHECK (check_out>check_in)
);

CREATE TABLE IF NOT EXISTS booking_rooms(
    booking_id INT NOT NULL,
    room_id INT NOT NULL,
    nightly_rate DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(booking_id, room_id),
    FOREIGN KEY(booking_id)
      REFERENCES bookings(booking_id),
    FOREIGN KEY(room_id)
      REFERENCES rooms(room_id)
);

CREATE TABLE IF NOT EXISTS payments(
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY(booking_id)
      REFERENCES bookings(booking_id)
);

CREATE TABLE IF NOT EXISTS staff(
    staff_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    job_title VARCHAR(50),
    phone VARCHAR(20),
    hire_date DATE
);

CREATE TABLE IF NOT EXISTS services(
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(255),
    service_price DECIMAL(10,2) NOT NULL
);

CREATE TABLE IF NOT EXISTS service_charges(
    charge_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    service_id INT NOT NULL,
    quantity INT NOT NULL DEFAULT 1,
    charge_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(booking_id)
      REFERENCES bookings(booking_id),
    FOREIGN KEY(service_id)
      REFERENCES services(service_id)
);

INSERT INTO room_types
  (type_name, description, price_per_night, capacity)
VALUES
  ('Standard','Comfortable standard room', 27000.00,2),
  ('Deluxe','Spacious deluxe room', 42000.00,2),
  ('Suite','Luxury suite with a seperate living area', 77000.00,4);

  SELECT*FROM room_types;

INSERT INTO rooms
  (room_number,room_type_id,floor_number,room_status)
VALUES
  ('101', 1, 1, 'Available'),
  ('102', 1, 1, 'Available'),
  ('201', 2, 2, 'Available'),
  ('202', 2, 2, 'Available'),
  ('301', 3, 3, 'Available');

SELECT*FROM rooms;

INSERT INTO guests
  (first_name,last_name,email,phone)
VALUES
  ('Amina', 'Bello', 'amina.bello@example.com', '08012345678'),
  ('Musa', 'Ibrahim', 'musa.ibrahim@example.com', '08023456789'),
  ('Fatima', 'Ali', 'fatima.ali@example.com', '08034567890');

SELECT*FROM guests;

INSERT INTO services
  (service_name,description,service_price)
VALUES
  ('Breakfast', 'Daily breakfast service', 5000.00),
  ('Laundry', 'Clothing washimg and ironing', 3000.00),
  ('Airport Pickup', 'Pickup and drop-off service', 10000.00);

SELECT*FROM services;

SELECT guest_id, first_name, last_name
FROM guests;

INSERT INTO bookings
  (guest_id,check_in,check_out,booking_status)
VALUES
  (1, '2026-11-10', '2026-11-13', 'Confirmed');

SELECT*FROM bookings;

INSERT INTO booking_rooms
  (booking_id,room_id,nightly_rate)
VALUES
  (1, 1, 27000.00);

SELECT
  booking_id,
  room_id,
  nightly_rate
FROM booking_rooms;

INSERT INTO payments
  (booking_id,amount,payment_method,payment_status)
VALUES
  (1, 81000.00, 'Card', 'Paid');

SELECT*FROM payments;

INSERT INTO service_charges
  (booking_id,service_id,quantity)
VALUES
  (1, 1, 1);

SELECT*FROM service_charges;

SELECT
  b.booking_id,
  g.first_name,
  g.last_name,
  b.check_in,
  b.check_out,
  r.room_number,
  rt.type_name,
  br.nightly_rate,
  p.amount AS payment_amount,
  p.payment_status,
  s.service_name,
  sc.quantity
FROM bookings b
INNER JOIN rooms AS r
  ON br.room_id = r.room_id
INNER JOIN room_types AS rt
  ON r.room_type_id = rt.room_type_id
JOIN guests g
  ON b.guest_id = g.guest_id
JOIN booking_rooms br
  ON b.booking_id = br.booking_id
JOIN rooms r
  ON br.room_id = r.room_id
LEFT JOIN payments p
  ON b.booking_id = p.booking_id
LEFT JOIN service_charges sc
  ON b.booking_id = sc.booking_id
LEFT JOIN services s
  ON sc.service_id = s.service_id;
