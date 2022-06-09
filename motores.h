#define M3 PORTB.RB7
#define M2 PORTB.RB6
#define M1 PORTB.RB5

// Servomotor 3
void servoM3Rotate0()
{
  M3 = 1;
  Delay_us(1050);
  M3 = 0;
  Delay_us(18950);
}

void servoM3Rotate180()
{
  M3 = 1;
  Delay_us(2050);
  M3 = 0;
  Delay_us(17950);
}

void servoM3Rotate90()
{
  M3 = 1;
  Delay_us(1550);
  M3 = 0;
  Delay_us(18450);
}

void servoM3Routine()
{
  servoM3Rotate0();
  delay_ms(1500);
  servoM3Rotate90();
  delay_ms(1500);
  servoM3Rotate0();
  delay_ms(1500);
  servoM3Rotate90();
  delay_ms(1500);
  servoM3Rotate0();
  delay_ms(1500);
  servoM3Rotate180();
  delay_ms(1500);
}

// Servomotor 2

void servoM2Rotate0()
{
  M2 = 1;
  Delay_us(1050);
  M2 = 0;
  Delay_us(18950);
}

void servoM2Rotate180()
{
  M2 = 1;
  Delay_us(2050);
  M2 = 0;
  Delay_us(17950);
}

void servoM2Rotate90()
{
  M2 = 1;
  Delay_us(1550);
  M2 = 0;
  Delay_us(18450);
}

void servoM2Routine()
{
  servoM2Rotate0();
  delay_ms(1500);
  servoM2Rotate90();
  delay_ms(1500);
  servoM2Rotate0();
  delay_ms(1500);
  servoM2Rotate90();
  delay_ms(1500);
  servoM2Rotate0();
  delay_ms(1500);
  servoM2Rotate180();
  delay_ms(1500);
}
// Servomotor 1

void servoM1Rotate0()
{
  M1 = 1;
  Delay_us(1050);
  M1 = 0;
  Delay_us(18950);
}

void servoM1Rotate180()
{
  M1 = 1;
  Delay_us(2050);
  M1 = 0;
  Delay_us(17950);
}

void servoM1Rotate90()
{
  M1 = 1;
  Delay_us(1550);
  M1 = 0;
  Delay_us(18450);
}

void servoM1Routine()
{
  servoM1Rotate0();
  delay_ms(1500);
  servoM1Rotate90();
  delay_ms(1500);
  servoM1Rotate0();
  delay_ms(1500);
  servoM1Rotate90();
  delay_ms(1500);
  servoM1Rotate0();
  delay_ms(1500);
  servoM1Rotate180();
  delay_ms(1500);
}
