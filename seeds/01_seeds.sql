INSERT INTO users (name, email, password)
VALUES('Eva Stanley', 'estanley22@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Louisa Meyer', 'l-mayer1@hotmail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Dominic Parks', 'domparks@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Sue Luna', 'sue_luna@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Etta West', 'etta-west1@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Steph Ackerman', 's.ackerman@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('James Marshall', 'james-marshall11@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'),
('Joel Zimmerman', 'kx5@ymail.com', '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.');

INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, parking_spaces, number_of_bathrooms, number_of_bedrooms, country, street, city, province, post_code, active)
VALUES (1, 'Jupiter', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg', 520.61, 3, 3, 5, 'Canada', 'Juke Street', 'Toronto', 'Ontario', 'M2X 6X0', true),
(1, 'Juno', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2121121/pexels-photo-2121121.jpeg', 349.99, 2, 1, 3, 'England', 'St Margarets Road', 'Oxford', 'Oxfordshrie', 'OX3 5FG', true),
(2, 'Neptune', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2080018/pexels-photo-2080018.jpeg', 225, 2, 2, 2, 'United States', 'Washington Blvd', 'New Orleans', 'Louisiana', '28510', true),
(4, 'Minerva', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg', 611, 1, 2, 4, 'Canada', 'Space Park Drive', 'Bowmanville', 'Quebec', 'Q2V 1B7', false),
(6, 'Mars', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1475938/pexels-photo-1475938.jpeg', 331, 0, 4, 2, 'Italy', 'Via Rosso', 'Roma', 'Lazio', '22451', false),
(7, 'Venus', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/1172064/pexels-photo-1172064.jpeg', 850, 6, 7, 10, 'Japan', 'Oda Street', 'Sapporo', 'Hokkaido', '190-8755', true),
(8, 'Apollo', 'description', 'https://images.pexels.com/photos/2086676/pexels-photo-2086676.jpeg?auto=compress&cs=tinysrgb&h=350', 'https://images.pexels.com/photos/2076739/pexels-photo-2076739.jpeg', 299, 4, 1, 3, 'United States', '2nd Street', 'Los Angeles', 'California', '90210', true);


INSERT INTO reservations (start_date, end_date, property_id, guest_id)
VALUES ('2022-05-26', '2022-06-04', 1, 1),
('2022-04-19', '2022-04-24', 3, 2),
('2022-08-11', '2022-08-18', 7, 5),
('2022-06-07', '2022-06-21', 6, 4),
('2022-09-01', '2022-09-10', 2, 1),
('2022-01-01', '2022-01-09', 1, 8),
('2022-02-26', '2022-03-05', 3, 6),
('2022-05-10', '2022-05-17', 7, 7),
('2022-10-26', '2022-11-02', 7, 6),
('2023-07-02', '2023-07-06', 6, 3);

INSERT INTO property_reviews (guest_id, property_id, reservation_id, rating, message)
VALUES (2, 5, 7, 4, 'message'),
(1, 2, 2, 5, 'message'),
(2, 5, 7, 2, 'message'),
(6, 8, 4, 4, 'message'),
(3, 6, 7, 1, 'message'),
(7, 5, 7, 3, 'message');