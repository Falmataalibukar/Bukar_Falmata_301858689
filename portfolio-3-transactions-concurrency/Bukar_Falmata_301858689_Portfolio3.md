PORTFOLIO 3: TRANSACTIONS AND CONCURRENCY

3.1 Introduction

Database transactions are sequences of operations treated as a single unit of work. They help maintain data accuracy and consistency in the Hotel Reservation System. This portfolio demonstrates transaction processing using ‘COMMIT’ and ‘ROLLBACK’, and explains how concurrency control helps prevent conflicts when multiple users access the database simultaneously.

3.2 Concurrency Control 

Concurrency occurs when two or more transactions access the same database data at the same time. Without proper control, one transaction may overwrite another transaction's changes or read data that has not been committed. The Hotel Reservation System must control concurrent access to room availability and bookings to prevent two guests from being assigned the same room for overlapping dates.

3.3 Transaction Management Using COMMIT and ROLLBACK

The Hotel Reservation System uses transactions to maintain data consistency. The ‘COMMIT’ command permanently saves changes made during a transaction, while ‘ROLLBACK’ cancels uncommitted changes and restores the data to its previous state. In this practical exercise, ‘ROLLBACK’ restored room 101's status to Available after a temporary change to Maintenance. In a separate transaction, ‘COMMIT’ saved room 102's status as Maintenance. These tests demonstrate the difference between committing and rolling back database changes.

3.3.1 ROLLBACK Transaction Example

The following SQL statement temporarily changes room 101's status to Maintenance. The ROLLBACK command then cancels the change, restoring the room to its original status of Available.

Result Analysis
The room status temporarily changed to Maintenance. After the transaction was rolled back, room 101 returned to Available. This confirms that the uncommitted change was undone.

3.3.2 COMMIT Transaction Example

The following SQL statement changes room 102's status to Maintenance and uses COMMIT to save the change permanently.

Result Analysis

The query returned room ID 2, room number 102, and status Maintenance. This confirms that the change was committed successfully and saved in the database.

3.4 Concurrency Control in the Hotel Reservation System

Concurrency control ensures that multiple users can access and update database records without causing inconsistent results. In the Hotel Reservation System, two receptionists might attempt to reserve the same room for overlapping dates. Without suitable controls, this could result in a double booking. MySQL supports transaction isolation and locking mechanisms that help coordinate simultaneous operations and protect data consistency. The system should also check room availability for the requested dates before confirming a reservation.

3.5 Transaction Isolation Level

The transaction isolation level configured in MySQL was checked using the following SQL query:

SELECT @@transaction_isolation;

Result: REPEATABLE_READ

Analysis

MySQL uses the REPEATABLE READ isolation level by default in many standard configurations. It helps maintain consistency when transactions read the same data repeatedly. This is important in the Hotel Reservation System because room availability and booking records may be accessed by multiple users at the same time. Appropriate transactions, locking, and availability checks help reduce the risk of conflicting booking operations.

3.6 Evaluation and Limitations

The transaction exercises demonstrated how COMMIT saves database changes and ROLLBACK reverses uncommitted changes. The isolation-level query confirmed that MySQL was using REPEATABLE-READ. These features support reliable database operations in the Hotel Reservation System.

However, the exercises used a small dataset and did not simulate two users booking the same room simultaneously. Therefore, they do not prove that all concurrency problems have been eliminated. A more complete test would use separate database sessions to simulate concurrent bookings and verify that transaction handling, locking, and room-availability checks prevent conflicting reservations.

3.7 Conclusion

This portfolio demonstrated important transaction and concurrency concepts using the Hotel Reservation System in MySQL. The practical exercises showed how COMMIT saves changes and ROLLBACK reverses uncommitted changes. The configured transaction isolation level was identified as REPEATABLE-READ. The discussion also highlighted the importance of concurrency control, room-availability checks, and appropriate locking to protect booking data. These exercises improved my understanding of how database transactions support data consistency and reliability.

