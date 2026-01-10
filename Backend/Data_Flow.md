# Data FLOW 

## How ESP32 Sends Data to Firebase

The ESP32 is connected to the internet using Wi-Fi. Once the connection is active, it starts collecting data from the robot such as battery level, movement status, and sensor values.

The ESP32 sends this data to Firebase using simple web requests. Each update is written to a specific location in the database that belongs to the robot. The data is sent either at fixed time intervals or when a value changes.

If the Wi-Fi connection drops, the ESP32 keeps trying to reconnect and sends fresh data again once the connection is restored.

## How the Mobile App Receives Data

The mobile app connects to Firebase after the user logs in. Instead of asking for data again and again, the app listens for changes in the database.

Whenever the ESP32 updates any value in Firebase, the app immediately receives the updated data. The app screen refreshes automatically to show the latest robot status without any manual action from the user.

This makes the system feel live and responsive.
