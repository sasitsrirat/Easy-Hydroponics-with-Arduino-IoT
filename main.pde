#include <Wire.h>
#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);
int analogPin = A0, val = 0, light = 0, bluePin = D7, Relay1 = D3;

void setup()
{
    Serial.begin(9600);
    lcd.init();
    pinMode({Relay1, bluePin}, OUTPUT);
}

void loop()
{
    pinMode(D7, OUTPUT);
    pinMode(D3, OUTPUT);
    delay(1000);

    int lightread = digitalRead(D0);
    val = analogRead(analogPin);

    Serial.print("Moisture = ");
    Serial.println(val);
    Serial.print("Light = ");
    Serial.println(lightread);
    Serial.print("LED = ");
    Serial.print(bluePin);

    lcd.backlight();
    lcd.clear();
    lcd.setCursor(0, 0);
    lcd.print("moisture : ");
    lcd.print(val);
    lcd.setCursor(0, 1);

    if (lightread)
    {
        lcd.print("Light : No Light");
        analogWrite(bluePin, 255);
    }
    else
    {
        lcd.print("Light : Light");
        analogWrite(bluePin, 0);
    }

    digitalWrite(Relay1, (val >= 700) ? HIGH : LOW);
}
