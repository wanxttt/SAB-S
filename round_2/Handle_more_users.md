## Scalability and Fault Handling

The system is designed to support future growth while minimizing the risk of failures.

## Handling Growth (Scalability)

The architecture separates hardware, backend, and mobile application, which allows each part to scale independently. As more robots, users, or patients are added, the system does not require major structural changes.

Firebase Realtime Database automatically scales to handle increased data traffic from multiple robots and mobile clients.

Each robot can use a unique device ID, allowing multiple robots to update data without conflict.

The mobile application listens only to relevant database nodes, reducing unnecessary data usage.

New medicines or patients can be added by extending the database structure without changing the core logic.

## Avoiding Failures (Reliability)

The system includes simple checks to prevent incorrect actions and data loss.

The robot updates medicine stock only once per patient visit, avoiding duplicate or accidental updates.

If Wi-Fi connectivity is lost, the robot continues basic movement locally and syncs data once the connection is restored.

Firebase provides built-in redundancy and data persistence, reducing the risk of data loss.

Input validation ensures that medicine stock values do not go below zero.

The mobile application reflects real-time database changes, ensuring consistent data across all devices.

## Fault Isolation

Failures in one part of the system do not affect the entire system.

Hardware issues do not directly impact the backend or mobile application.

Backend configuration changes can be made without modifying robot firmware.

App updates can be released independently without stopping robot operation.

 
