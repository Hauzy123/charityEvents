
const express = require('express');
const router = express.Router();
const dbcon = require("../models/database");

const connection = dbcon.getconnection();
connection.connect();

// Fetch all events
router.get("/", (req, res) => {
    connection.query("SELECT * FROM events", (err, results) => {
        if (err) return res.status(500).json({ error: "Failed to retrieve events." });
        res.json(results);
    });
});

// Search Events
router.get("/search", (req, res) => {
    const { date, location, category } = req.query;
    let query = "SELECT * FROM events WHERE 1=1";
    const params = [];

    if (date) {
        query += " AND DATE(start_time) = ?";
        params.push(date);
    }
    if (location) {
        query += " AND location LIKE ?";
        params.push(`%${location}%`);
    }
    if (category) {
        query += " AND category = ?";
        params.push(category);
    }

    connection.query(query, params, (err, results) => {
        if (err) return res.status(500).json({ error: "Search failed." });
        res.json(results);
    });
});

// Get Event Details
router.get("/:id", (req, res) => {
    const eventId = req.params.id;
    connection.query("SELECT * FROM events WHERE event_id = ?", [eventId], (err, results) => {
        if (err || results.length === 0) return res.status(404).json({ error: "Event not found." });
        res.json(results[0]);
    });
});

// Register for an Event
router.post("/register", (req, res) => {
    const { event_id, email, ticket_count } = req.body;

    connection.query("SELECT event_name FROM events WHERE event_id = ?", [event_id], (err, rows) => {
        if (err || rows.length === 0) return res.status(400).json({ error: "Invalid event ID" });

        const event_name = rows[0].event_name;

        connection.query(
            "INSERT INTO registration (event_id, event_name, email, ticket_count) VALUES (?, ?, ?, ?)",
            [event_id, event_name, email, ticket_count || 1],
            (err) => {
                if (err) return res.status(500).json({ error: "Registration failed" });
                res.json({ message: "Registered successfully!" });
            }
        );
    });
});

module.exports = router;
