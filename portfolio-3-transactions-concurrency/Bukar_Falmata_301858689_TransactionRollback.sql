USE hotel_reservation_system;

SELECT room_id, room_number, room_status
FROM rooms
WHERE room_id = 1;

START TRANSACTION;

UPDATE rooms
SET room_status = 'Maintenance'
WHERE room_id = 1;

SELECT room_id, room_number, room_status
FROM rooms
WHERE room_id = 1;

ROLLBACK;