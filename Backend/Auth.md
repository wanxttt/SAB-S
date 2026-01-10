# Auth Flow 

## Authentication Flow
Authentication is handled using Firebase Authentication.

When the mobile app starts, the user is asked to log in. Firebase checks the login details and allows access only if the user is valid.

Once authenticated, the app is allowed to read robot data and send commands. If a user is not logged in, they cannot access or change any data.

The ESP32 is allowed to write robot data only to specific database paths. Security rules ensure that unknown users or devices cannot modify the data.

## Real-Time Syncing Logic

Firebase automatically handles syncing between the robot and the app.

Whenever data changes:

ESP32 writes new data → Firebase updates instantly

App receives update automatically

No refresh or manual request is needed

The same logic works in reverse for commands.
