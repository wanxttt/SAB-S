AiVa Medication Inventory & App Synchronization DFD

This Data Flow Diagram (DFD) explains how data moves between the patient, robot, inventory database, and caregiver app to keep everything in sync.

Entities & Processes Explained

- Patient (Elderly User)
  Requests medication by activating the wristband (triggers the robot).

- Medication Dispensing Process (1.0)  
  The robot delivers medicine to the patient. After delivery, it sends a "Dispense Confirmation" to update records.

- Inventory Management Process (2.0)
  Receives the dispense confirmation and reduces stock count. Also accepts manual restock data from the app.

- Alert Management Process (3.0)  
  Checks current stock levels. If stock is low (less than 3 days), sends a low-stock signal to trigger an alert.

- App Synchronization Process (4.0)
  Keeps the mobile app updated in real-time with stock changes, delivery status, and alerts. Also allows caregivers to send manual restock updates back to the database.

- Prescription & Dosage Records  
  Stores patient details, medicine schedule, and dosage information (used by dispensing process).

- Medication Inventory Database  
  Stores current stock levels. Updated after every dispense or restock.

Main Data Flows
- Patient → Medication Request → Dispensing Process  
- Dispensing Process → Dispensed Medication → Patient  
- Dispensing Process → Dispense Confirmation → Inventory Management  
- Inventory Management → Updated Stock Data → App Synchronization  
- Inventory Management → Restock Data → Database  
- Inventory → Low-Stock Signal → Alert Management → Alert Notification → App  
- App → Manual Restock Data → Inventory Management

This DFD shows a closed loop: delivery updates stock → low stock triggers alert → caregiver restocks → sync back to robot and app. It ensures no stock-outs and full transparency for caregivers.