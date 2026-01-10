#include <WiFi.h>
#include <Firebase_ESP_Client.h>
#include <ESP32Servo.h>

#define L1 26
#define L2 27
#define R1 14
#define R2 12

#define SERVO_PIN 18

#define IR_LEFT   34
#define IR_CENTER 35
#define IR_RIGHT  32

#define TRIG_PIN 5
#define ECHO_PIN 17

#define WIFI_SSID "POCO X4 PRO 5G"
#define WIFI_PASSWORD "BUbs3456@"

#define API_KEY "AIzaSyC-glfz52EBdFCWz6usmMJSbVt4kfsCvdw"
#define DATABASE_URL "https://aivaaa.firebaseio.com/"

Servo headServo;

FirebaseData fbdo;
FirebaseAuth auth;
FirebaseConfig config;

int leftVal, centerVal, rightVal;
int stopDist = 15;

bool stockUpdated = false;

void setup() {
  Serial.begin(115200);

  pinMode(L1, OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(R1, OUTPUT);
  pinMode(R2, OUTPUT);

  pinMode(TRIG_PIN, OUTPUT);
  pinMode(ECHO_PIN, INPUT);

  headServo.attach(SERVO_PIN);
  headServo.write(90);

  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
  }

  config.api_key = API_KEY;
  config.database_url = DATABASE_URL;

  Firebase.begin(&config, &auth);
  Firebase.reconnectWiFi(true);
}

void loop() {
  int distance = readDistance();

  if (distance > 0 && distance < stopDist) {
    stopBot();

    if (!stockUpdated) {
      reduceMedicineStock();
      stockUpdated = true;
    }

    delay(2000);
    moveBackward();
    delay(400);
    stopBot();
  } 
  else {
    stockUpdated = false;
    trackLight();
  }

  delay(50);
}

void trackLight() {
  leftVal = analogRead(IR_LEFT);
  centerVal = analogRead(IR_CENTER);
  rightVal = analogRead(IR_RIGHT);

  if (leftVal < 100 && centerVal < 100 && rightVal < 100) {
    stopBot();
    return;
  }

  if (centerVal >= leftVal && centerVal >= rightVal) {
    moveForward();
  }
  else if (leftVal > centerVal && leftVal > rightVal) {
    turnLeft();
  }
  else if (rightVal > centerVal && rightVal > leftVal) {
    turnRight();
  }
}

void moveForward() {
  digitalWrite(L1, HIGH); digitalWrite(L2, LOW);
  digitalWrite(R1, HIGH); digitalWrite(R2, LOW);
}

void moveBackward() {
  digitalWrite(L1, LOW); digitalWrite(L2, HIGH);
  digitalWrite(R1, LOW); digitalWrite(R2, HIGH);
}

void turnLeft() {
  digitalWrite(L1, LOW);  digitalWrite(L2, HIGH);
  digitalWrite(R1, HIGH); digitalWrite(R2, LOW);
}

void turnRight() {
  digitalWrite(L1, HIGH); digitalWrite(L2, LOW);
  digitalWrite(R1, LOW);  digitalWrite(R2, HIGH);
}

void stopBot() {
  digitalWrite(L1, LOW); digitalWrite(L2, LOW);
  digitalWrite(R1, LOW); digitalWrite(R2, LOW);
}

int readDistance() {
  digitalWrite(TRIG_PIN, LOW);
  delayMicroseconds(2);
  digitalWrite(TRIG_PIN, HIGH);
  delayMicroseconds(10);
  digitalWrite(TRIG_PIN, LOW);

  long duration = pulseIn(ECHO_PIN, HIGH, 30000);
  if (duration == 0) return -1;

  return duration * 0.034 / 2;
}

void reduceMedicineStock() {
  int currentStock;

  if (Firebase.RTDB.getInt(&fbdo, "/medicine/paracetamol/stock")) {
    currentStock = fbdo.intData();
    if (currentStock > 0) {
      Firebase.RTDB.setInt(
        &fbdo,
        "/medicine/paracetamol/stock",
        currentStock - 1
      );
    }
  }
}
