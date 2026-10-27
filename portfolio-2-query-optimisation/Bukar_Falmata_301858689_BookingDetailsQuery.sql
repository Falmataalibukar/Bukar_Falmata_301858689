USE hotel_reservation_system;

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
FROM bookings AS b
JOIN guests AS g
    ON b.guest_id = g.guest_id
JOIN booking_rooms AS br
    ON b.booking_id = br.booking_id
JOIN rooms AS r
    ON br.room_id = r.room_id
JOIN room_types AS rt
    ON r.room_type_id = rt.room_type_id
LEFT JOIN payments AS p
    ON b.booking_id = p.booking_id
LEFT JOIN service_charges AS sc
    ON b.booking_id = sc.booking_id
LEFT JOIN services AS s
    ON sc.service_id = s.service_id;