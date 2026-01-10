AiVa Inventory & Sync Flowchart

This flowchart explains what happens after medicine delivery regarding stock management and alerts.

Step-by-Step Explanation

1. Dispense Medicine 
   The robot successfully delivers the medicine to the patient.

2. Update Stock (-1) & Sync to App
   The system automatically reduces the stock count by 1 and sends this update to the mobile app (via Firebase or local sync).

3. Read LCR Sensors
   (Optional step in some versions — robot may re-check signal while updating, but mainly stock is updated independently.)

4. Stock Low? Decision  
   System checks remaining medicine quantity.  
   - No → Process ends automatically.  
   - Yes → Move to alert.

5. Trigger App Alert  
   Sends a "Low Stock" push notification to the caregiver's app so they know to order more medicine.

6. Manual Restock on App  
   Caregiver adds new medicine and updates stock in the app.  
   This sends +1 (or more) to the stock count.

7. Update Stock (+1) & Sync to App  
   New stock is saved and synced back to the robot/database.

8. Sync Update Robot Stock  
   Robot receives the new stock value so it knows how much is left.

9. Loop back to Stock Low?  
   If still low after restock (unlikely), alert again. Otherwise, end process.

Why This Flowchart Is Important
It creates a safety net: automatic stock reduction after every dose, real-time sync with app, early warnings before medicine runs out, and easy manual restock — all to prevent treatment breaks, especially for elderly patients living alone.