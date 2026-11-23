-- This makes sure that foreign_key constraints are observed
PRAGMA foreign_keys = ON;

BEGIN TRANSACTION;

-- Events table
CREATE TABLE IF NOT EXISTS events (
    event_id INTEGER PRIMARY KEY AUTOINCREMENT,

    event_name TEXT NOT NULL,

    event_description TEXT NOT NULL,

    category TEXT NOT NULL,

    event_date TEXT NOT NULL,

    full_ticket_price REAL NOT NULL,

    full_ticket_quantity INTEGER NOT NULL,

    concession_ticket_price REAL NOT NULL,

    concession_ticket_quantity INTEGER NOT NULL,

    published_date TEXT,

    published INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS settings (

    setting_id INTEGER PRIMARY KEY,

    site_name TEXT NOT NULL,

    site_description TEXT NOT NULL

);

INSERT INTO settings
VALUES
(
    1,
    'University Club Hub',
    'Find and book university events'
);

-- Bookings table
CREATE TABLE IF NOT EXISTS bookings (
    booking_id INTEGER PRIMARY KEY AUTOINCREMENT,
    event_id INTEGER NOT NULL,
    attendee_name TEXT NOT NULL,
    full_tickets INTEGER NOT NULL,
    concession_tickets INTEGER NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

COMMIT;