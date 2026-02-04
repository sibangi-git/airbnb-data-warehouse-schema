USE airbnb_schema;

-- 1. Dimension: Date
INSERT INTO dimdate_sibangis (dateKey, fullDate, day, month, year, quarter, dayOfWeek) VALUES
(20251001, '2025-10-01', 1, 10, 2025, 4, 'Wednesday'),
(20251002, '2025-10-02', 2, 10, 2025, 4, 'Thursday'),
(20251003, '2025-10-03', 3, 10, 2025, 4, 'Friday'),
(20251010, '2025-10-10', 10, 10, 2025, 4, 'Friday'),
(20251011, '2025-10-11', 11, 10, 2025, 4, 'Saturday'),
(20251015, '2025-10-15', 15, 10, 2025, 4, 'Wednesday'),
(20251020, '2025-10-20', 20, 10, 2025, 4, 'Monday'),
(20251021, '2025-10-21', 21, 10, 2025, 4, 'Tuesday'),
(20251025, '2025-10-25', 25, 10, 2025, 4, 'Saturday'),
(20251101, '2025-11-01', 1, 11, 2025, 4, 'Saturday');

-- 2. Dimension: Customer
INSERT INTO dimcustomer_sibangis (customerKey, customerID, firstName, lastName, email, password, phone, country) VALUES
(1, 101, 'Alice', 'Smith', 'alice@email.com', 'pass123', '555-1234', 'USA'),
(2, 102, 'Bob', 'Johnson', 'bob@email.com', 'pass123', '555-5678', 'Canada'),
(3, 103, 'Charlie', 'Brown', 'charlie@email.com', 'pass123', NULL, 'USA'), 
(4, 104, 'David', 'Lee', 'david@email.com', 'pass123', '555-9999', 'UK'),
(5, 105, 'Eve', 'Davis', 'eve@email.com', 'pass123', '555-8888', 'Australia'),
(6, 106, 'Frank', 'Martin', 'frank@email.com', 'pass123', NULL, 'Germany'),
(7, 107, 'Grace', 'Wilson', 'grace@email.com', 'pass123', '555-7777', 'USA'),
(8, 108, 'Heidi', 'Taylor', 'heidi@email.com', 'pass123', '555-6666', 'Canada'),
(9, 109, 'Ivan', 'Moore', 'ivan@email.com', 'pass123', '555-5555', 'Mexico'),
(10, 110, 'Judy', 'Hall', 'judy@email.com', 'pass123', NULL, 'USA');

-- 3. Dimension: Host
INSERT INTO dimhost_sibangis (hostKey, hostID, firstName, lastName, email, password, phone, country) VALUES
(1, 201, 'Host', 'One', 'host1@email.com', 'hpass', '111-2222', 'USA'),
(2, 202, 'Host', 'Two', 'host2@email.com', 'hpass', '111-3333', 'Canada'),
(3, 203, 'Host', 'Three', 'host3@email.com', 'hpass', NULL, 'UK'),
(4, 204, 'Host', 'Four', 'host4@email.com', 'hpass', '111-5555', 'USA'),
(5, 205, 'Host', 'Five', 'host5@email.com', 'hpass', '111-6666', 'Australia'),
(6, 206, 'Host', 'Six', 'host6@email.com', 'hpass', NULL, 'Germany'),
(7, 207, 'Host', 'Seven', 'host7@email.com', 'hpass', '111-8888', 'USA'),
(8, 208, 'Host', 'Eight', 'host8@email.com', 'hpass', '111-9999', 'Mexico'),
(9, 209, 'Host', 'Nine', 'host9@email.com', 'hpass', '111-0000', 'Canada'),
(10, 210, 'Host', 'Ten', 'host10@email.com', 'hpass', NULL, 'USA');

-- 4. Dimension: Booking Status
INSERT INTO Dim_BookingStatus_sibangis (statusName, paymentType) VALUES
('Confirmed', 'Credit Card'),
('Pending', 'PayPal'),
('Cancelled', 'Credit Card'),
('Completed', 'Apple Pay'),
('Pending', 'Credit Card'),
('Confirmed', 'PayPal'),
('Cancelled', NULL),
('Completed', 'Credit Card'),
('Confirmed', 'Google Pay'),
('Pending', NULL);

-- 5. Dimension: Amenity
INSERT INTO Dim_Amenity_sibangis (amenityID, name, description) VALUES
(1001, 'WiFi', 'High-speed internet access'),
(1002, 'Pool', 'Shared or private swimming pool'),
(1003, 'Kitchen', 'Fully equipped kitchen'),
(1004, 'Free Parking', 'Free parking on premises'),
(1005, 'Hot Tub', NULL),
(1006, 'Air Conditioning', 'Central or portable AC'),
(1007, 'Self Check-in', 'Keypad or lockbox'),
(1008, 'Pet Friendly', 'Pets are allowed'),
(1009, 'Gym', NULL),
(1010, 'Indoor Fireplace', 'Wood or gas fireplace');

-- 6. Dimension: Stay
INSERT INTO dimstay_sibangis (stayKey, stayID, title, location, pricePerNight, numberOfBedrooms, numberOfBathrooms, numberOfGuests) VALUES
(1, 301, 'Cozy Downtown Apartment', 'New York', 150.00, 1, 1, 2),
(2, 302, 'Sunny Beach House', 'Los Angeles', 300.00, 3, 2, 6),
(3, 303, 'Rustic Mountain Cabin', 'Denver', 200.00, 2, 1, 4),
(4, 304, 'Modern City Loft', 'Chicago', 180.00, 1, 1, 3),
(5, 305, 'Lakeside Cottage', 'Austin', 220.00, 2, 2, 5),
(6, 306, 'Suburban Family Home', 'Dallas', 250.00, 4, 3, 8),
(7, 307, 'Studio near Campus', 'Denton', 90.00, 0, 1, 2),
(8, 308, 'Luxury Penthouse', 'Miami', 500.00, 3, 3, 6),
(9, 309, 'Quaint Country Farmhouse', 'Nashville', 170.00, 2, 1, 4),
(10, 310, 'Historic Row Home', 'Boston', 210.00, 2, 2, 4);

-- 7. Dimension: Experience
INSERT INTO dimexperience_sibangis (experienceKey, experienceID, title, description, location, pricePerPerson, capacity, experienceDate) VALUES
(1, 401, 'Historical Walking Tour', 'A 2-hour tour of downtown.', 'Boston', 25.00, 15, '2025-01-01'),
(2, 402, 'Italian Cooking Class', 'Learn to make pasta from scratch.', 'New York', 75.00, 10, '2025-01-05'),
(3, 403, 'Surfing Lessons', 'Catch a wave in LA.', 'Los Angeles', 50.00, 5, '2025-01-10'),
(4, 404, 'Mountain Biking Adventure', 'Guided trail ride.', 'Denver', 60.00, 8, '2025-01-15'),
(5, 405, 'Live Music Crawl', 'Visit the best bars in Nashville.', 'Nashville', 40.00, 20, '2025-01-20'),
(6, 406, 'Foodie Tour', 'Taste the best of Austin.', 'Austin', 65.00, 12, '2025-01-25'),
(7, 407, 'Art Gallery Hopping', 'Explore Chicago\'s art scene.', 'Chicago', 30.00, 10, '2025-02-01'),
(8, 408, 'Yacht Day Trip', 'A day on the water.', 'Miami', 150.00, 8, '2025-02-05'),
(9, 409, 'BBQ Masterclass', 'Learn from a pitmaster.', 'Dallas', 80.00, 10, '2025-02-10'),
(10, 410, 'Campus Ghost Tour', 'Spooky stories from UNT.', 'Denton', 20.00, 25, '2025-02-15');

-- 8. Bridge Table: Stay Amenity
INSERT INTO Bridge_Stay_Amenity_sibangis (stayKey, amenityKey) VALUES
(1, 1),
(1, 3), 
(1, 6),
(2, 1), 
(2, 2), 
(2, 3),
(3, 1), 
(3, 10),
(4, 1),
(4, 7);

-- 9. Fact Table: Booking
INSERT INTO factbooking_sibangis (bookingKey, customerKey, hostKey, stayKey, experienceKey, checkInDateKey, checkOutDateKey, bookingDateKey, statusKey, totalAmount, attendees) VALUES
(1, 1, 1, 1, NULL, 20251010, 20251015, 20251001, 1, 750.00, 2),
(2, 2, 2, 2, NULL, 20251011, 20251015, 20251002, 2, 1200.00, 4),
(3, 3, 3, 3, NULL, 20251020, 20251025, 20251003, 1, 1000.00, 3),
(4, 7, 7, 7, NULL, 20251101, 20251015, 20251010, 3, 180.00, 1),
(5, 4, 10, NULL, 10, 20251020, 20251020, 20251003, 1, 40.00, 2),
(6, 5, 2, NULL, 2, 20251021, 20251021, 20251002, 1, 150.00, 2),
(7, 8, 9, NULL, 5, 20251025, 20251025, 20251010, 4, 80.00, 2),
(8, 6, 5, 5, 6, 20251020, 20251025, 20251011, 1, 1230.00, 2),
(9, 9, 8, 8, 8, 20251010, 20251015, 20251001, 5, 2800.00, 4),
(10, 10, 4, 4, NULL, 20251101, 20251015, 20251011, 3, 900.00, 3); 


-- 10. Fact Table: Review
INSERT INTO factreview_sibangis (reviewKey, customerKey, stayKey, experienceKey, reviewDateKey, rating, comment) VALUES
(1, 1, 1, NULL, 20251015, 5.00, 'Great location, very clean!'),
(2, 2, 2, NULL, 20251015, 4.00, 'Loved the beach, but house was a bit old.'),
(3, 3, 3, NULL, 20251025, 5.00, 'Perfect cabin getaway. So cozy.'),
(4, 8, 5, NULL, 20251025, 4.50, NULL),
(5, 5, NULL, 2, 20251021, 5.00, 'Learned so much! The pasta was amazing.'),
(6, 8, NULL, 5, 20251025, 4.00, 'Fun tour, but a bit crowded.'),
(7, 4, NULL, 10, 20251020, 5.00, 'So spooky and fun!'),
(8, 6, 5, NULL, 20251025, 4.00, 'The lake was beautiful.'),
(9, 6, NULL, 6, 20251025, 5.00, 'Best tacos I have ever had.'),
(10, 9, 8, NULL, 20251015, 5.00, NULL);