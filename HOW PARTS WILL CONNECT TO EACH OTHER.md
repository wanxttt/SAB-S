# What PARTS IT NEEDS AND HOW PARTS WILL CONNECT WITH EACH OTHER ( Below Is The Image ) 

## Hardware Components Required
1.) Robot and Control 2.)ESP32 Wi-Fi Microcontroller 3.)Motor Driver Shield (L298N or AFMotor Shield) 4.) Robot Chassis
5.) 4 × DC Motors
6.) 4 × Wheels
7.) Servo Motor
8.)  Sensors
9.) IR Sensors (3 × for light or direction tracking)
10.) Ultrasonic Sensor (HC-SR04)
11.) Power and Wiring
12.) Battery Pack (7.4V / 9V / suitable for motors)
13.) Jumper Wires (Male–Male, Male–Female)
14.) Power Switch

Software and Cloud Components

1.) Firebase Realtime Database

2.) Firebase Authentication

3.) Flutter Mobile Application

4.) Arduino IDE (ESP32 Board Support)

5.) Firebase ESP Client Library

The system is built using three main layers: the robot hardware, Firebase backend, and mobile application. Each layer communicates with the others through clearly defined data paths to ensure smooth operation and real-time updates.

## 1. Robot (ESP32) to Firebase

The ESP32 acts as the main controller of the robot. It connects to the internet using Wi-Fi and communicates directly with Firebase Realtime Database.

Sensor data such as obstacle distance, IR readings, and delivery status is sent from the ESP32 to Firebase.

When the robot reaches a patient and dispenses medicine, it updates the medicine stock in Firebase.

If stock goes below a defined limit, the ESP32 triggers a low-stock status update in Firebase.

This allows the backend to always maintain the latest state of the robot and medicine inventory.

## 2. Firebase as the Central Hub

Firebase Realtime Database works as the central communication layer between the robot and the mobile application.

It stores medicine stock levels, delivery status, and scheduling data.

Any update made by the ESP32 is instantly reflected in the database.

Firebase Authentication ensures that only authorized users and devices can access or modify data.

Firebase handles synchronization automatically, so both the robot and the app always see the same data.

## 3. Mobile Application to Firebase

The mobile application is developed using Flutter and stays connected to Firebase in real time.

The app listens for changes in medicine stock, delivery updates, and alerts.

When the database changes, the app UI updates instantly without manual refresh.

The app can also send commands or schedule data to Firebase, which the ESP32 reads and acts upon.

This allows remote monitoring and control of the robot through the mobile application.




<img width="1280" height="720" alt="image" src="https://github.com/user-attachments/assets/dbf771b0-b4e8-4d28-97f0-1315bc3f8d0f" />
