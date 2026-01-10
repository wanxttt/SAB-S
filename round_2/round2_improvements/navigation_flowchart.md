AiVa Navigation Flowchart

This flowchart shows the complete navigation and delivery process of the AiVa robot.

Step-by-Step Explanation

1. Trigger Alarm & Alert
   The process starts when the scheduled time arrives. The wristband worn by the patient triggers a loud audio-visual alarm to notify the patient that it's time for medicine.

2. Wristband Emits IR Signal  
   Once the alarm is active, the wristband begins emitting an infrared (IR) signal continuously. This signal carries the patient's location information for the robot to follow.

3. Read LCR Sensors
   The AiVa robot continuously reads its three Left-Center-Right (LCR) IR sensors to detect the strength of the incoming signal from the wristband.

4. Signal Direction Decision
   Based on which sensor detects the strongest IR signal:  
   - Strongest on Left sensor → Robot turns left  
   - Strongest on Center sensor → Robot moves straight forward  
   - Strongest on Right sensor → Robot turns right  

   This triangulation method allows real-time direction adjustment without any pre-mapped path.

5. Arrived at Patient?
   The robot keeps checking if it has reached the patient (signal very strong + very close distance via ultrasonic sensor).  
   - No → Continues reading LCR sensors and adjusting direction.  
   - Yes → Stops moving.

6. Stop & Dispense Medicine
   The robot stops safely, the servo activates, and the correct medicine is dispensed to the patient.

This flowchart ensures the robot reaches the patient quickly, accurately, and safely by always following the strongest IR signal while avoiding obstacles.