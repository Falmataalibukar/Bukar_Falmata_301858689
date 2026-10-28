PORTFOLIO 4: NOSQL AND ADVANCED DATA MODELS

4.1 Introduction

This portfolio explores the use of a NoSQL database in the Hotel Reservation System. MongoDB was selected because it stores data in flexible, document-based structures. MongoDB Compass was used to connect to the MongoDB server and manage the database.

The implementation demonstrates how guest and booking information can be stored and retrieved using MongoDB. It also compares the NoSQL approach with the relational database implemented in MySQL.

4.2 MongoDB Data Model

MongoDB is a NoSQL database that stores information in documents, which are organised into collections. Unlike MySQL, which stores related information in tables with predefined columns, MongoDB documents can contain flexible fields.

For the Hotel Reservation System, the MongoDB database is named hotel_reservation_system. Two collections were created:

guests: Stores guest information, including guest ID, first name, last name, email address, and phone number.

bookings: Stores booking information, including booking ID, guest ID, guest name, check-in date, check-out date, booking status, room number, nightly rate, and payment status.

The booking document includes the guest name directly alongside the booking details. This demonstrates how MongoDB can store related information together in one document, reducing the need for joins in some queries. The guest_id is also retained to identify the related guest.

4.3 MongoDB Implementation

MongoDB was implemented using MongoDB Compass connected to a MongoDB server running through Docker Desktop. The database hotel_reservation_system was selected, and the guests and bookings collections were created.

A guest document was inserted into the guests collection with the following information: guest ID 1, first name Amina, last name Bello, email address, and phone number.

A booking document was inserted into the bookings collection with booking ID 1, guest ID 1, guest name Amina Bello, check-in date of 10 November 2026, check-out date of 13 November 2026, room number 101, booking status Confirmed, and payment status Paid. The nightly room rate was updated to 27000 to match the revised value in MySQL.

The find() operation was used to retrieve and verify the stored documents, while updateOne() was used to correct the nightly rate. The successful update confirmed that MongoDB could modify an existing booking record.
 
4.4 Comparison of MySQL and MongoDB

MySQL and MongoDB are both useful database management systems, but they organise and manage data differently.

MySQL is a relational database that stores information in tables with defined columns and relationships. In the Hotel Reservation System, MySQL uses tables such as guests, rooms, bookings, and payments. Relationships between these tables are maintained using primary keys and foreign keys.

MongoDB is a document-oriented NoSQL database that stores information in collections containing flexible documents. In this implementation, the guests and bookings collections store guest and booking information as documents.

MySQL is suitable for hotel reservation operations that require structured relationships, data integrity, and transactions, such as confirming bookings and recording payments. MongoDB is useful when information needs a flexible structure or when related information can conveniently be stored together in a document.

Both systems can support the Hotel Reservation System. The choice depends on the application's data structure, consistency requirements, query patterns, and operational needs. MongoDB does not automatically replace MySQL, each has strengths that make it suitable for different requirements.

4.5 Evaluation and Limitations

The MongoDB implementation successfully demonstrated the creation of a database, the creation of collections, insertion of guest and booking documents, retrieval of records, and updating of an existing booking. MongoDB Compass provided a graphical interface for managing the database, while MongoDB Shell was used to execute commands.

One advantage of MongoDB is its flexible document structure, which allows related information such as guest names and booking details to be stored together. This can simplify some retrieval operations.

However, storing the same guest information in multiple booking documents may cause duplication and inconsistencies if the guest's details change. MongoDB also requires careful data validation and appropriate application logic to maintain booking integrity and prevent conflicting reservations.

This implementation was a small practical demonstration using sample records. Further work would be required to implement comprehensive validation, prevent double bookings, manage payments securely, and test performance with a larger dataset.

4.6 Conclusion

This portfolio demonstrated the practical use of MongoDB as a NoSQL database for the Hotel Reservation System. The guests and bookings collections were created, sample documents were inserted and retrieved, and an existing booking record was updated successfully.

The exercise provided practical experience with document-based data modelling and highlighted the differences between MongoDB and MySQL. MySQL remains useful for structured relationships and transactional operations, while MongoDB offers flexibility for storing document-based information.
Overall, using both database systems demonstrates how different database technologies can support different requirements within a hotel reservation application.
