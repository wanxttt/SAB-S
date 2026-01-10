Testing & Validation – Round 2-:
App Testing:
Whole app tested end-to-end.
Auth failure: Login failed with wrong creds — showed error, logged to console. Fixed by checking network + retry button.
Database not fetch: Data didn't load due to connection issue — failure mentioned, fixed using local JSON file as backup for offline mode.
Stock sync: Tested low-stock alert, sent notification correctly after dispense.

Product Testing:
Full system: Alert → signal → move → dispense.
Turns not working: Robot didn't turn properly — failure due to weak IR intensity read. Fixed by code changes to measure and compare signal strength accurately.
Connectivity: Motors connected to L293D shield, shield to ESP32 — tested movement based on IR, worked after fix.

Edge Cases
Signal loss: Robot stopped safely.
Low battery: Alert sent.