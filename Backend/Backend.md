# Explanation of Backend 

The robot is controlled by an ESP32 module, which allows it to connect directly to the internet using Wi-Fi. As soon as the robot starts, 
the ESP32 establishes a network connection and prepares itself to send and receive information online.

Different sensors on the robot continuously generate data related to its working condition, 
such as power level and movement status. The ESP32 reads this information, processes it internally, and converts it into clean values that can be stored digitally.

Once the data is ready, the ESP32 uploads it to Firebase. 
Firebase works as a shared online space where the robot saves its latest status. 
Any update made by the robot is instantly stored in the cloud, making the information available at all times.

The mobile application is linked to the same Firebase system. After the user logs in, 
the app is allowed to access the robot’s data. Instead of repeatedly requesting updates,
the app automatically receives new data whenever the robot sends something new. 
This makes the interaction fast and smooth.

Control instructions follow the same path in reverse. When a user gives a command through the app, 
it is saved in Firebase. The ESP32 continuously monitors these updates and performs the required action as soon as a new instruction appears.

Security and reliability are handled by Firebase itself. 
Only verified users can access the data, and the system remains stable 
even if the internet connection briefly disconnects and reconnects.
