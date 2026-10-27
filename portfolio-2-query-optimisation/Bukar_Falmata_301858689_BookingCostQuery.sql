USE hotel_reservation_system;

SELECT
    b.booking_id,
    g.first_name,
    g.last_name,
    r.room_number,
    br.nightly_rate,
    DATEDIFF(b.check_out, b.check_in) AS number_of_nights,
    br.nightly_rate *
        DATEDIFF(b.check_out, b.check_in) AS room_total
FROM bookings AS b
JOIN guests AS g
    ON b.guest_id = g.guest_id
JOIN booking_rooms AS br
    ON b.booking_id = br.booking_id
JOIN rooms AS r
    ON br.room_id = r.room_id;