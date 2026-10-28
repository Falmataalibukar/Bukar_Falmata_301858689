PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION

2.2 SQL Queries and Their Purpose

Crescent View Hotel is a simulated hotel business used as the case study for this portfolio. It's a Hotel Reservation System that stores guest information, room details, bookings, and payment records. This activity focuses on SQL queries and query optimisation to retrieve booking details, calculate booking costs, summarise payments, list guest bookings, and identify available rooms efficiently.

2.2.1 Booking Details Query

The booking details query retrieves reservation information by joining the Bookings, Guests, Booking Rooms, Rooms, and Room Types tables. It also uses left joins to retrieve payment and additional service information when available.

The query demonstrates the use of SQL JOIN operations to combine related information from multiple tables into a single result. This is useful for hotel staff who need to review guest reservations, assigned rooms, payment status, and additional services.

Query Result and Analysis
The query executed successfully in MySQL Workbench and returned booking information by combining data from multiple related tables.

The result displayed the booking ID, guest name, check-in and check-out dates, room number, room type, nightly rate, payment amount, payment status, and additional service information.

For the sample record, the booking belongs to Amina Bello, who reserved room 101 at a nightly rate of 27000. The reservation covers three nights, and the recorded payment is 81000 with a payment status of Paid. The result demonstrates how JOIN and LEFT JOIN operations can combine related information into a useful report for hotel management.

2.2.2 Booking Cost Calculation Query

This query calculates the total accommodation cost for a booking by multiplying the room's nightly rate by the number of nights between the check-in and check-out dates. The DATEDIFF() function calculates the length of the stay in days.

The query joins the Bookings, Guests, Booking Rooms, and Rooms tables to retrieve the guest's name, booking dates, assigned room, nightly rate, number of nights, and total room cost.

This calculation helps hotel staff determine accommodation charges accurately and provides useful information for billing and payment management.

Query Result and Analysis

The query executed successfully in MySQL Workbench and returned the calculated accommodation cost for the sample booking.
The result showed that Amina Bello booked room 101 for three nights at a nightly rate of 27000. The total accommodation cost was calculated as 81000.

The DATEDIFF() function correctly calculated the number of nights between the check-in date and check-out date. Multiplying this value by the nightly room rate produced the total room cost.

This query demonstrates how SQL date functions, arithmetic expressions, and JOIN operations can be combined to support accurate hotel billing and reservation management.

2.2.3 Total Payments Received Query

This query calculates the total amount of payments received by the hotel by using the SQL SUM() aggregate function. It retrieves and adds together the payment amounts for records whose payment status is 'Paid'.

The query uses the Payments table and a WHERE condition to include only successful payments in the calculation. This helps hotel management monitor revenue received from guests and distinguish completed payments from pending or unsuccessful transactions.

This query adds together only the payments marked as ‘Paid’. With your current sample data, the expected result is 81000. 

Query Result and Analysis

The query executed successfully in MySQL Workbench and returned a total payment amount of 81000.
The SUM() function calculated the combined value of payment records where the payment status was 'Paid'. The WHERE clause ensured that only completed payments were included in the calculation.

This query demonstrates the use of an aggregate function and a filtering condition to produce a financial summary. It can help hotel management monitor payments received and support basic revenue reporting.

2.2.4 Guest Booking List Query

This query retrieves a list of hotel bookings together with the names of the guests who made them. It joins the Bookings table with the Guests table using the guest_id field.

The CONCAT() function combines each guest's first name and last name into a single guest_name column. The ORDER BY clause arranges the results by check-in date, making it easier for hotel staff to review upcoming and existing reservations in date order.

This query demonstrates how SQL JOIN operations, string functions, and sorting can be used to produce a clear and organised booking report.

This query lists each booking with the guest's full name, check-in and check-out dates, and booking status, ordered by check-in date. 

Query Result and Analysis

The query executed successfully in MySQL Workbench and returned the booking records together with the names of the guests who made them.

The result displayed the booking ID, guest name, check-in date, check-out date, and booking status. The ORDER BY clause arranged the records according to their check-in dates, making the booking list easier to review.

This query demonstrates the use of JOIN to retrieve related information from multiple tables, CONCAT() to combine guest names, and ORDER BY to sort query results. These features are useful for preparing organised reservation reports for hotel management.

2.2.5 Available Rooms Query

This query retrieves the rooms currently marked as Available in the Hotel Reservation System. It joins the Rooms table with the Room Types table to display each room's number, room type, standard price per night, and availability status.
The WHERE clause filters the results to include only rooms whose room_status is 'Available'. The ORDER BY clause sorts the results by room number.

This query helps hotel staff identify rooms that are recorded as available and provide guests with information about room categories and prices. It demonstrates the use of JOIN, WHERE, and ORDER BY clauses in SQL.

This query lists rooms whose recorded status is ‘Available’, together with their room types and prices.

Query Result and Analysis

The query retrieves rooms whose recorded status is 'Available' and displays their room numbers, room types, prices per night, and availability status.

The JOIN operation combines room information with the corresponding room type and price. The WHERE clause filters out rooms with other statuses, while ORDER BY arranges the results by room number.

This query helps hotel staff identify rooms recorded as available and communicate their prices to prospective guests. However, the result reflects the room_status stored in the database; a complete availability check for a particular date range would also need to consider existing bookings and overlapping reservation dates.

2.3 Query Execution Plans and Optimisation

MySQL provides the EXPLAIN statement to show how a query is expected to be executed. It provides information about the tables accessed, the access method, possible indexes, selected keys, and the estimated number of rows examined.

In this portfolio, EXPLAIN is used to examine the execution plan for the guest booking list query. Analysing the execution plan helps identify opportunities to improve query performance, especially when the database grows and contains more records.
The execution plan will be examined before and after adding an appropriate index to compare the selected access methods and estimated rows.

2.3.1 Analysis of the Initial Execution Plan

The EXPLAIN statement was executed successfully in MySQL Workbench to examine the execution plan for the Guest Booking List query.

The execution plan showed that MySQL used a nested-loop inner join to combine the Bookings and Guests tables. It performed a table scan on the Bookings table and sorted the booking records by check-in date. For the Guests table, MySQL used the primary key index on guest_id to look up the matching guest record.

The plan also showed an estimated cost and number of rows for each operation. Because the database contains only a small sample of records, these estimates provide a baseline rather than conclusive evidence of performance on a large dataset.
The initial plan identifies possible areas for further investigation, including access to booking records and sorting by check-in date. An appropriate index can be tested to determine whether it improves the execution plan.

2.3.2 Comparison Before and After Indexing

An index named idx_bookings_check_in was created on the check_in column of the Bookings table to investigate whether it could improve the Guest Booking List query.

The EXPLAIN plan before indexing showed a table scan on Bookings, followed by sorting on check_in. After creating the index, the execution plan remained unchanged: MySQL continued to scan the Bookings table and sort the results.

This indicates that the optimizer did not consider the new index necessary for this query with the current sample dataset. Since the table contains very few booking records, a table scan may be less expensive than using the index. The result demonstrates that adding an index does not automatically improve every query's execution plan.

The index may be more useful when the database contains substantially more bookings or when queries filter or order larger numbers of records. Further testing with a larger dataset
would be required to determine whether the index provides a measurable performance improvement.

2.3.3 Index Creation and Purpose

The index idx_bookings_check_in was created on the check_in column of the Bookings table using the following SQL statement:

The purpose of this index was to investigate whether MySQL could use an index to help process the Guest Booking List query, which sorts booking records by check-in date.

The index was created successfully in MySQL Workbench. However, the EXPLAIN results showed that MySQL continued to use a table scan and sort operation for the sample dataset. This demonstrates the importance of evaluating query execution plans rather than assuming that adding an index will always improve performance.

Indexes can improve data retrieval in suitable circumstances, but they also require storage space and can add overhead to INSERT, UPDATE, and DELETE operations because the index must be maintained when data changes.

2.4 Performance Evaluation and Limitations

The query optimisation exercise demonstrated how MySQL Workbench and the EXPLAIN statement can be used to inspect query execution plans. The initial execution plan showed a table scan on the Bookings table, a sorting operation on check-in dates, and a primary key lookup on the Guests table.

After an index was created on the check_in column, the execution plan remained unchanged. This suggests that MySQL's optimizer considered the original execution strategy appropriate for the small sample dataset.

A limitation of this exercise is that the database contains only a few records. Consequently, the results do not establish how the query would perform with a large volume of bookings. A more comprehensive evaluation would use a larger dataset and compare execution time, estimated rows examined, and execution plans before and after indexing.

Overall, the exercise demonstrates that query optimisation requires analysis and testing. Indexes should be selected based on query patterns and measured results rather than added without evaluation.
