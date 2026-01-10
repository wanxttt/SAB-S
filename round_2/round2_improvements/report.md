AiVa - Where AI Meets Human Care-:
System Design and Architecture
AiVa is built as a proactive robot system with integrated hardware and software for medication delivery. The architecture includes:

Hardware Connectivity: All 4 DC motors are connected to the L293D motor driver shield for control. The shield is directly linked to the ESP32 microcontroller, which runs the code. IR intensity is measured by LCR sensors on the ESP32 to determine movement direction — stronger signal on left/center/right decides turn or straight path.

Parts Connectivity:
Wristband → Emits IR signal (activated by alarm).
Robot Sensors (LCR + Ultrasonic) → Read signal and obstacles, connected to ESP32.
ESP32 → Processes data, controls motors via shield, and syncs with Firebase (for app).
Servo → Connected to ESP32 for dispensing.
Mobile App → Links to Firebase for schedules, stock, alerts.

This setup ensures real-time homing, obstacle avoidance, and delivery without fixed maps.