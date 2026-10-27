USE hotel_reservation_system;

SELECT
    r.room_number,
    rt.type_name,
    rt.price_per_night,
    r.room_status
FROM rooms AS r
JOIN room_types AS rt
    ON r.room_type_id = rt.room_type_id
WHERE r.room_status = 'Available'
ORDER BY r.room_number;