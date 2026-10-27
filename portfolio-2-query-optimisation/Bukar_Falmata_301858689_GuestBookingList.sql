USE hotel_reservation_system;

SELECT
    b.booking_id,
    CONCAT(g.first_name, ' ', g.last_name) AS guest_name,
    b.check_in,
    b.check_out,
    b.booking_status
FROM bookings AS b
JOIN guests AS g
    ON b.guest_id = g.guest_id
ORDER BY b.check_in;