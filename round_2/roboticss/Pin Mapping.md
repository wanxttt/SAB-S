# Explaination Of Pin Mapping

## Hardware Connections and Pin Usage
Since the motor shield is mounted directly on top of the Arduino, most of the digital pins are already occupied by the shield. Because of this limitation, the remaining available pins are used carefully to connect sensors and other components.

Motors (M1, M2, M3, M4):
All motors are connected to the screw terminals provided on the motor shield.

Servo Motor:
The servo is connected to the 3-pin header labeled SERVO_1 on the motor shield. This header is internally mapped to digital pin 10.

IR Sensors (Light Intensity Detection):
IR photodiodes are used to measure light intensity, which produces analog values. To read these values, the analog input pins available on the shield are used.

Ultrasonic Sensor:
The ultrasonic sensor uses two remaining analog pins, configured as digital pins for trigger and echo signals.

## Pin Mapping

Left IR Sensor → A0
Center IR Sensor → A1
Right IR Sensor → A2
Ultrasonic Trigger → A3
Ultrasonic Echo → A4

## System Logic Flow

The robot operates based on a simple and reliable decision-making process that combines sensor readings and safety checks.

Scan:
The robot continuously reads data from the three IR sensors.

Compare:
The sensor values are compared to determine which direction has the highest light intensity.

Safety Check:
The ultrasonic sensor checks for obstacles in front of the robot.

Action:

If the center IR sensor detects the highest intensity, the robot moves forward.

If the left IR sensor detects the highest intensity, the robot turns left.

If the right IR sensor detects the highest intensity, the robot turns right.

If an obstacle is detected, the robot stops immediately and performs a reverse or turn action as a safety override.
