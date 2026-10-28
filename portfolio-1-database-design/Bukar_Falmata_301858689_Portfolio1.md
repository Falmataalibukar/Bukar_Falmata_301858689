PORTFOLIO 1: DATABASE DESIGN AND MODELLING

1.1 Case Study Description

Selected Organisation: Crescent View Hotel (Simulated Organisation)

Crescent View Hotel is a simulated hotel business used as the case study for this MIT 8103 Advanced Database Systems portfolio. It's Hotel Reservation System that manages guest information, room details, bookings, and payment records. The database design identifies the main entities, their attributes, primary keys, foreign keys, and relationships to support the hotel's daily operations.

The database will store information about guests, room types, available rooms, bookings, payments, hotel staff, services, and service charges. It will support important hotel operations such as registering guests, making reservations, assigning rooms, calculating accommodation costs, recording payments, and checking room availability.

The portfolio will use MySQL as the relational database management system for storing structured information and managing transactions. MongoDB will also be used to demonstrate document based data storage and advanced database concepts.

The purpose of this portfolio is to design, implement, test, and evaluate a database system that supports the daily operations of a hotel while maintaining data accuracy, consistency, and reliability.

1.2 Database Requirements

The Hotel Reservation System must meet the following requirements:

Guests Management: The system must store guest details, including names, email addresses, phone numbers.

Room Management: The system must store room numbers, room types, price per night, capacity, and room availability status.

Booking Management: The system must record reservations, including guest details, check-in dates, check-out dates, and booking status.

Room Assignment: The system must link each booking to one or more rooms and record the agreed nightly rate.

Payment Management: The system must record payment amounts, payment dates, payment method, and payment status.

Service Management: The system must record additional services offered by the hotel, such as breakfast, laundry, and airport pickup.

Reporting: The system must support queries that show booking details, calculate accommodation costs, list available rooms, and summarise payments.  

1.3 Identification of Database Entities

The Hotel Reservation System consists of nine main entities. Each entity stores information about a specific part of the hotel’s operations.

Guests: Stores guests information, including names, email addresses, and phone numbers.

Room Types: Stores room categories, descriptions, price per night, and maximum capacity.

Rooms: Stores individual room number, floors, room types, and availability status.

Bookings: Stores reservation details, including the guest making the booking, check-in date, check-out date, and booking status.

Booking rooms: Connects bookings to rooms and records the nightly rate charged for each assigned room.

Payments: Stores payment amount, dates, methods, and payment status for bookings.

Staff: Stores hotel employee information, including names, contact details, job titles, and hire dates.

Services: Stores additional hotel services such as breakfast, laundry, and airport pickup.

Service Charges: Records the additional services associated with bookings, including quantities and charge dates.

These entities are related through primary keys and foreign keys to maintain referential integrity and reduce unnecessary duplication of data.

1.4 Primary Keys and Foreign Keys

A primary key uniquely identifies each record in a database table. A foreign key links records between related tables and helps maintain referential integrity.

The primary and foreign keys used in the Hotel Reservation System are described below.


Table

Guests

Room Types

Rooms

Bookings

Booking Rooms

Payments

Staff

Services

Service Charges


Primary Key

guest_id

room_type_id

room_id

booking_id

booking_id, room_id (composite key)

payment_id

staff_id

service_id

charge_id


Foreign Key

None

None

room_type_id

guest_id

booking_id, room_id

booking_id

None

None

booking_id, service_id


The Booking Rooms table uses a composite primary key consisting booking_id and room_id. This identifies each booking-room combination and prevents the same room from being assigned more than once to the same booking.


1.5 Database Constraints

The Hotel Reservation System uses database constraints to maintain data integrity and prevent invalid records.

Primary Key Constraint: Each table has a primary key that uniquely identifies its records. The Booking Rooms table uses a composite primary key consisting of booking_id and room_id.

Foreign Key Constraint: Foreign keys connect related tables and ensure that referenced records exist. For example, the bookings table references the guests table through guest_id.

UNIQUE Constraint: Unique constraints prevent duplicate values in important fields. Examples include guest email addresses, room numbers, room type names, staff email addresses, and service names.

NOT NULL Constraint: Required fields must contain values. For example, guest names, room numbers, booking dates, and room prices are required when creating the relevant records.

DEFAULT Constraint: Default values are provided for certain fields. For example, new bookings have a default status of Pending, while rooms have a default status of Available.

CHECK Constraint: The bookings table includes a check constraint requiring the check-out date to be later than the check-in date.

These constraints improve the reliability of the database by enforcing rules at the database level rather than relying only on users or application software.

1.6 Database Normalisation

Database normalisation is the process of organising data into related tables to reduce duplication and improve data integrity. The Hotel Reservation System is designed using the principles of First Normal Form (1NF), Second Normal Form (2NF), and Third Normal Form (3NF).

First Normal Form (1NF): Each table stores individual values in its fields, and each record can be uniquely identified by a primary key. For example, guest names and contact details are stored in separate columns in the Guests table.

Second Normal Form (2NF): The database tables satisfy 1NF, and non-key attributes depend on the whole primary key. The Booking Rooms table uses a composite primary key consisting of booking_id and room_id, while nightly_rate describes the rate for that booking-room combination.

Third Normal Form (3NF): The database is designed to avoid storing non-key information that depends on other non-key attributes. For example, room type descriptions and standard prices are stored in the Room Types table rather than being repeated in every room record. Guest information is also stored separately from booking information.

The separation of guests, bookings, rooms, room types, payments, and services reduces redundant data and makes updates easier to manage. This design helps prevent insertion, update, and deletion anomalies while maintaining consistency through primary keys, foreign keys, and other constraints.

1.8 Relational Schema

Guests:

Guests(guest_id PK, first_name, last_name, email UNIQUE, phone, created_at).

Room Types:

Room_Types(room_type_id PK, type_name UNIQUE, description, price_per_night, capacity).

Rooms:

Rooms(room_id PK, room_number UNIQUE, room_type_id FK → Room_Types.room_type_id, floor_number, room_status).

Bookings:

Bookings(booking_id PK, guest_id FK → Guests.guest_id, check_in, check_out, booking_status, booking_date).

Booking Rooms:

Booking_Rooms(booking_id PK, FK → Bookings.booking_id, room_id PK, FK → Rooms.room_id, nightly_rate).

Note: booking_id and room_id together form a composite primary key.

Payments:

Payments(payment_id PK, booking_id FK → Bookings.booking_id, amount, payment_date, payment_method, payment_status).

Staff:

Staff(staff_id PK, first_name, last_name, email UNIQUE, job_title, phone, hire_date).

Services:

Services(service_id PK, service_name UNIQUE, description, service_price).

Service Charges:

Service_Charges(charge_id PK, booking_id FK → Bookings.booking_id, service_id FK → Services.service_id, quantity, charge_date).


1.9 Normalisation Example: UNF to 3NF
Unnormalised Form (UNF)
In the unnormalised form, data may contain repeating groups and duplicated information in a single record. For example, a hotel reservation record could store guest details, booking details, room information, payment information, and additional services together.


An example of an unnormalised hotel reservation record is shown below:


Booking ID

1


Guest Name

Amina Bello


Guest Email

aminabello@example.com


Room Numbers

101, 102


Room Types

Standard, Deluxe


Services

Breakfast, Laundry

This record contains multiple room numbers, room types, and services in single fields. These repeating groups make the data difficult to search, update, and maintain consistently. Therefore, the data needs to be reorganised into First Normal Form (1NF).

First Normal Form (1NF)
To convert the unnormalised data into First Normal Form, each field must contain a single value, and repeating groups must be removed. Each record must also be uniquely identifiable.


The hotel reservation data can be represented as follows:


Booking ID

1

1


Guest Name

Amina Bello

Amina Bello


Guest Email

aminabello@example.com

aminabello@example.com


Room Numbers

101

102


Room Types

Standard

Deluxe


Services

Breakfast

Laundry

In this example, each field contains a single value rather than a list of room numbers or services. However, guest and booking details are repeated across rows. These repetitions can cause update and data maintenance problems, so further normalisation is required.
The data can now be examined for Second Normal Form (2NF).



Second Normal Form (2NF)
To achieve Second Normal Form, a table must first satisfy 1NF. It must also ensure that every non-key attribute depends on the whole primary key, not just part of a composite key.
In the hotel reservation example, booking information, guest information, room information, and service information describe different entities. Keeping all these details in one table causes unnecessary duplication.
The data can be separated into related tables as follows:


Bookings

Booking ID (PK)

1


Guest Name

Amina Bello

Guest Email

aminabello@example.com


Booking Rooms

Booking ID (PK, FK)

1

2


Room ID (PK, FK)

101

102


Nightly Rate

27000

42000

The Booking Rooms table uses a composite primary key consisting of Booking ID and Room ID. The nightly rate depends on the specific booking-room combination.
Separating booking information from room assignments reduces repeated data and helps satisfy 2NF. Further separation of details that depend on other non-key attributes is used to achieve Third Normal Form (3NF).

Third Normal Form (3NF)
To achieve Third Normal Form, a table must satisfy 2NF and must not contain transitive dependencies. This means that non-key attributes should depend on the primary key, the whole primary key, and nothing but the primary key.
In the Hotel Reservation System, room type details should be stored separately from individual room records. Similarly, guest details should be stored separately from booking records, and service descriptions and prices should be stored separately from service charges.
The data is therefore organised into related tables such as:


Guests

guest_id (PK)

1


first_name

Amina

last_name

Bello

email

aminabello@example.com


Room Types

Room_type_id (PK)

1

2


type_name

Standard

Deluxe


price_per_night

27000

42000

Rooms

room_id (PK)

1

2


room_number

101

102


room_type_id (FK)

1

2

Services

service_id (PK)

1

2


service_name

Breakfast

Laundry


service_price

5000

3000

In this structure, room type information is stored in the Room Types table rather than repeated in the Rooms table. Guest and service details are also stored separately from bookings and service charges.
This separation reduces data duplication, prevents update anomalies, and improves data integrity. The resulting structure is consistent with the 3NF design principles used in the Hotel Reservation System.

1.10 Portfolio 1 Conclusion

The Hotel Reservation System database was designed using an entity-relationship model and translated into a relational schema consisting of nine related tables. Primary keys, foreign keys, and integrity constraints were used to maintain data accuracy and consistency. The normalisation process demonstrated how unnormalised data can be organised into First, Second, and Third Normal Forms to reduce unnecessary duplication and prevent data anomalies. The resulting database design provides a structured foundation for managing hotel guests, rooms, reservations, payments, and additional services.
