const int PressureSensor1pin = A0;
//const int PressureSensor2pin = A1;
const int FlowSensorpin = A1;



int PS1 = 0;
//int PS2 = 0;
int FS = 0;

//sample frequency
#define sample_freq 1000 //[Hz]

const float sample_period = 1000/(sample_freq);   // sample period [millis seconds]

void setup() {
  Serial.begin(9600);
}

void loop() {

  PS1 = analogRead(PressureSensor1pin);
  //PS2 = analogRead(PressureSensor2pin);
  FS = analogRead(FlowSensorpin);

  // Send the sensor values and the current time to the serial port
  String dataString = String(PS1) + "," + String(FS);
  
  Serial.println(String(millis()) + "," + dataString);
  delay(sample_period);
}
