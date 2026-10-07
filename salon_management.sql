CREATE DATABASE IF NOT EXISTS salon_management CHARACTER SET utf8mb4;
USE salon_management;
DROP TABLE IF EXISTS appointments, contact_messages, services, stylists, admins, users;
CREATE TABLE users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(120) NOT NULL UNIQUE,phone VARCHAR(15) NOT NULL,password VARCHAR(255) NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE admins(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,email VARCHAR(120) NOT NULL UNIQUE,password VARCHAR(255) NOT NULL);
CREATE TABLE services(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,category ENUM('Hair','Skin','Nails','Makeup') NOT NULL,description VARCHAR(255),price DECIMAL(8,2) NOT NULL,duration INT NOT NULL,image VARCHAR(100) DEFAULT 'haircut.jpg');
CREATE TABLE stylists(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100) NOT NULL,specialization VARCHAR(100),experience INT DEFAULT 0,description VARCHAR(255),available_days VARCHAR(100),image VARCHAR(100) DEFAULT 'stylist-1.jpg');
CREATE TABLE appointments(id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,service_id INT NOT NULL,stylist_id INT NOT NULL,appt_date DATE NOT NULL,appt_time TIME NOT NULL,customer_name VARCHAR(100),phone VARCHAR(15),request VARCHAR(255),status ENUM('Pending','Confirmed','Completed','Cancelled') DEFAULT 'Pending',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE,FOREIGN KEY(service_id) REFERENCES services(id) ON DELETE CASCADE,FOREIGN KEY(stylist_id) REFERENCES stylists(id) ON DELETE CASCADE);
CREATE TABLE contact_messages(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(100),email VARCHAR(120),message TEXT,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
INSERT INTO services(name,category,description,price,duration,image) VALUES
('Haircut','Hair','Precision cut and blow-dry tailored to your face shape.',500,45,'haircut.jpg'),
('Hair Styling','Hair','Curls, waves or sleek finish for any occasion.',700,60,'hair-styling.jpg'),
('Hair Coloring','Hair','Global colour, highlights and balayage with premium colour.',2500,120,'hair-coloring.jpg'),
('Hair Spa','Hair','Deep conditioning treatment for smooth, shiny hair.',1200,60,'hair-spa.jpg'),
('Facial','Skin','Deep-cleansing facial for a radiant glow.',1500,60,'facial.jpg'),
('Cleanup','Skin','Quick refresh to remove dirt and dullness.',800,40,'cleanup.jpg'),
('Skin Treatment','Skin','Advanced treatment for acne, pigmentation and dullness.',2200,75,'skin-treatment.jpg'),
('Manicure','Nails','Nail shaping, cuticle care and polish.',600,45,'manicure.jpg'),
('Pedicure','Nails','Relaxing foot soak, scrub and polish.',800,60,'pedicure.jpg'),
('Party Makeup','Makeup','Flawless long-lasting look for parties and events.',2000,60,'makeup.jpg'),
('Bridal Makeup','Makeup','Complete bridal makeup and hairstyle package.',15000,180,'bridal-makeup.jpg');
INSERT INTO stylists(name,specialization,experience,description,available_days,image) VALUES
('Ananya','Senior Hair Stylist',5,'Expert in modern cuts, colour and styling.','Mon, Tue, Thu, Sat','stylist-1.jpg'),
('Priya','Makeup & Bridal Specialist',4,'Bridal looks, party makeup and hair-do.','Tue, Wed, Fri, Sun','stylist-2.jpg'),
('Riya','Skin & Nail Therapist',3,'Facials, skin treatments, manicure and pedicure.','Mon, Wed, Fri, Sat','stylist-3.jpg');
