const int buttonPin = 7;     // pin knop
const int ledPin =  13;      // pin led

int buttonState = 0;            

void setup() {
  pinMode(ledPin, OUTPUT);
  
  pinMode(buttonPin, INPUT);

  Serial.begin(9600);
}

void loop() {
  buttonState = digitalRead(buttonPin);
  
  if (buttonState == HIGH) {
    digitalWrite(ledPin, HIGH);
    Serial.print('a');
  } else {
    digitalWrite(ledPin, LOW);
  }
  delay(100);
} 
