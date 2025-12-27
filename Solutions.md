# Solutions: AiVa — Where AI Meets HumanCare

AiVa is an AI-powered assistive robotic system engineered to bridge the gap between medical technology and empathetic elderly care. It specifically targets medication non-adherence in elderly, chronic-care, and disabled populations.

## Core Technical Solution

Our system automates the medication delivery cycle through a three-stage process:

### 1. Intelligent Alerting System
* **Persistence Logic:** At scheduled intervals, AiVa triggers a high-frequency acoustic alarm. 
* **Fail-safe Mechanism:** The alert remains active until physical or voice acknowledgement is received, ensuring reminders are never missed due to deep sleep or hearing impairment.

### 2. Signal-Based Navigation (Homing)  
* **Smart Wristband Integration:** Once the alert is acknowledged, a wearable smart wristband begins emitting IR signals.
* **Signal Strength Localization:** The robot utilizes RSSI (Received Signal Strength Indicator) logic to triangulate and follow the strongest signal path, allowing it to navigate directly to the patient’s precise location without requiring a pre-mapped environment.

### 3. Precision Delivery
* **Dose Verification:** Upon reaching the patient, the robot dispenses the pre-allocated medication, eliminating the "double-dose" or "missed-dose" confusion common in memory-related conditions.

---

## Intellectual Property & Innovation
* **Patent Status:** This solution is officially protected under **Patent Number: 202511095020**.
* **Innovation Focus:** Unlike stationary dispensers, AiVa’s proactive mobility ensures the medicine reaches the patient, rather than expecting the patient to reach the medicine.

##  Future Roadmap (Round 2)
* **Inventory Management:** Automated medicine stock tracking via a dedicated mobile application.
* **Caregiver Synchronization:** Real-time push notifications to caregivers when a dose is successfully administered or if a refill is required.
* Automation of Mobile app will be added in future scope.
