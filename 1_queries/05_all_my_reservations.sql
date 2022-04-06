SELECT reservations.id as id, properties.title as title, reservations.start_date as start_date, properties.cost_per_night as cost_per_night, avg(property_reviews.rating) as average_rating
FROM properties
JOIN reservations ON reservations.property_id = properties.id
JOIN property_reviews ON property_reviews.property_id = properties.id
JOIN users ON users.id = property_reviews.guest_id
WHERE users.id = 1
GROUP BY reservations.id, properties.title, properties.cost_per_night
ORDER BY start_date
LIMIT 10;