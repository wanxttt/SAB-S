# AiVa - Where Ai Meets Humancare
## DFD Explanation of the AIVa System:

The Data Flow Diagram (DFD) represents how information moves through the AIVa human care assistance system and how different components interact with each other to achieve the goal of timely medicine delivery to the patient.

The process begins with the patient, who wears a wristband alert system. When the patient requires assistance or medicine, the wristband is activated. This activation generates a signal that contains direction-related information. This signal acts as the primary input to the AIVa system.

Once the signal is sent or transferred, the AIVa robot receives it through its Left, Center, and Right (LCR) sensors. These sensors continuously collect directional and environmental data. The incoming signal is analyzed to determine the relative position of the patient.

After receiving the signal, the system enters the decision-making process, where sensor data is interpreted. Based on this data, the robot decides the direction in which it needs to move. At the same time, obstacle detection data is processed to ensure safe navigation. If an obstacle is detected, the robot adjusts its path accordingly to avoid collisions.

During navigation, the system refers to internal data such as medicine information and patient-related details, which may be stored in the system’s memory. This ensures that the correct medicine is delivered to the correct patient.

Once the robot successfully reaches the patient’s location, the medicine dispensing process is initiated. The required medicine is delivered to the patient, completing the data flow cycle.


In summary, the DFD shows a continuous flow of data starting from patient input, moving through signal transmission, sensor interpretation, navigation and obstacle handling, and finally ending with medicine delivery. This structured flow ensures accuracy, safety, and minimal response time in patient care.

