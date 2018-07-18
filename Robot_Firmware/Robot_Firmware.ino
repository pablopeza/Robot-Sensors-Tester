int left_sensor_pin = A2;
int center_sensor_pin = A1;
int right_sensor_pin = A0;
int m1_pin = 9;
int m2_pin = 10;
int led_1 = 7;
int led_2 = 12;
int buzzer = 8;


void setup() {

Serial.begin(9600);

}

void loop() {

  Serial.print(analogRead(A2));
  Serial.print(",");
  Serial.print(analogRead(A1));
  Serial.print(",");
  Serial.print(analogRead(A0));
  Serial.println("");
  delay(100);
}
