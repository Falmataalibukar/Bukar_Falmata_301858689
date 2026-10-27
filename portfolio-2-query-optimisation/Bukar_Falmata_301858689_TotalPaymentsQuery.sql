USE hotel_reservation_system;

SELECT
    SUM(amount) AS total_payments_received
FROM payments
WHERE payment_status = 'Paid';