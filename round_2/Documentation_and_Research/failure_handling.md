Failure Handling Protocol-:
App Authentication Failure-:
Symptom: Login fails (401/403 error).
Handling: Show error message, log details (timestamp, JSON). Prevent actions until fixed.

Database Not Fetch Failure-:
Symptom: Data doesn't load from Firebase.
Handling: Use local JSON file as backup. Log error, retry on reconnect.

Product Turn Failure-:
Symptom: Robot not taking turns.
Handling: Checked IR intensity in code — fixed by adjusting measurement logic. Log signal values for debug.

Reporting to Backend Developer-:
Create GitHub Issue with title "[URGENT] [Failure Type] – AiVa" (e.g., Auth Failure).
Include: Error code, timestamp, steps, logs/JSON, screenshots.
Send email/Slack with same details + attachments.

This ensures quick fixes with full info.