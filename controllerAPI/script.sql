CREATE TABLE CharityEvents ( 
	EventID INT PRIMARY KEY AUTO_INCREMENT, 
	EventName VARCHAR(255) NOT NULL, 
	EventType VARCHAR(100), 
	Description TEXT, 
	EventDate DATE, 
	StartTime TIME, 
	EndTime TIME, 
	VenueName VARCHAR(255), 
	Address VARCHAR(255), 
	City VARCHAR(100), 
	OrganizerName VARCHAR(255), 
	ContactEmail VARCHAR(255), 
	WebsiteURL VARCHAR(255), 
	RegistrationRequired BOOLEAN, 
	RegistrationLink VARCHAR(255), 
	TicketPrice DECIMAL(8,2) );


CREATE TABLE EventRegistrations (
    RegistrationID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT NOT NULL,                          
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(50),
    Age INT,
    Gender VARCHAR(50),
    

    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (EventID) REFERENCES CharityEvents(EventID)
        ON DELETE CASCADE
);


INSERT INTO CharityEvents (
    EventName, EventType, Description,
    EventDate, StartTime, EndTime,
    VenueName, Address, City,
    OrganizerName, ContactEmail, WebsiteURL,
    RegistrationRequired, RegistrationLink, TicketPrice
) VALUES
-- 1. Hope Run 2025
('Hope Run 2025', 'Awareness Walk', 'A community fun run to raise awareness for mental health.',
 '2025-10-15', '08:00:00', '12:00:00',
 'Ela Beach', 'Ela Beach Road', 'Port Moresby',
 'Mental Wellness Foundation', 'info@mwf.org.pg', 'https://mwf.org.pg/hoperun',
 TRUE, 'https://mwf.org.pg/register', 0.00),

-- 2. Books for Kids
('Books for Kids', 'Fundraiser', 'A book fair to raise funds for literacy programs.',
 '2025-11-05', '10:00:00', '16:00:00',
 'Vision City Mall', 'Waigani Drive', 'Port Moresby',
 'Read PNG', 'contact@readpng.org', 'https://readpng.org/booksforbrains',
 FALSE, NULL, 5.00),

-- 3. Clean Beach Day
('Clean Beach Day', 'Environmental Drive', 'Beach cleanup and awareness campaign.',
 '2025-10-20', '07:00:00', '11:00:00',
 'Fisherman\'s Island', 'Boat pickup from Koki Wharf', 'Port Moresby',
 'EcoPNG', 'volunteer@ecopng.org', 'https://ecopng.org/cleancoast',
 TRUE, 'https://ecopng.org/signup', 0.00),

-- 4. Hearts for Harmony
('Hearts & Harmony', 'Charity Concert', 'Live music event supporting heart disease research.',
 '2025-12-01', '18:00:00', '22:00:00',
 'Sir John Guise Stadium', 'Waigani Drive', 'Port Moresby',
 'PNG Heart Alliance', 'events@pngheart.org', 'https://pngheart.org/concert',
 TRUE, 'https://pngheart.org/tickets', 20.00),

-- 5. Food for All
('Food for All', 'Donation Drive', 'Community food collection for holiday distribution.',
 '2025-12-10', '09:00:00', '14:00:00',
 'Gordons Market', 'Gordons Road', 'Port Moresby',
 'Feed PNG', 'donate@feedpng.org', 'https://feedpng.org/foodforall',
 FALSE, NULL, 0.00);

CREATE TABLE EventRegistrations (
    RegistrationID INT PRIMARY KEY AUTO_INCREMENT,
    EventID INT NOT NULL,                          
    FullName VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL,
    PhoneNumber VARCHAR(50),
    Age INT,
    Gender VARCHAR(50),
    

    RegistrationDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (EventID) REFERENCES CharityEvents(EventID)
        ON DELETE CASCADE
);
