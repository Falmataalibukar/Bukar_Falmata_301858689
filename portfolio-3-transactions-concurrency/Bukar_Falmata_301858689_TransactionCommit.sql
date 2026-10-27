USE hotel_reservation_system;

START TRANSACTION;

UPDATE rooms
SET room_status = 'Maintenance'
WHERE room_id = 2;

COMMIT;

SELECT room_id, room_number, room_status
FROM rooms
WHERE room_id = 2;