#include "lcd.h"
#include "ds1307.h"
#include "motores.h"


#define LED_PORT PORTB
#define STATUS_LED PORTC.RC2

char hora = 15, minutos = 59, segundos = 40, dia = 30, mes = 3, ano = 18, dia_semana = 7;

char alarmaH[10];
char alarmaM[10];
char dispensers1[10];
char dispensers2[10];
char dispensers3[10];

char buffer[5];

char sentinel = 0;

void blinkAllLED() {
  char i;
  for(i=0; i<2; i++){
    LED_PORT = 0XFF;
    delay_ms(300);
    LED_PORT = 0;
    delay_ms(300);
  }
}

void clearBuffer()
{
  buffer[0] = '\0';
  buffer[1] = '\0';
  buffer[2] = '\0';
  buffer[3] = '\0';
}

void displayAddedAlarm(char hour, char minute)
{
  Lcd_out(1, 1, "Alarma:         ");
  Lcd_out(2, 1, "H: ");
  Lcd_chr_cp((hour / 10) + 48);
  Lcd_chr_cp((hour % 10) + 48);
  Lcd_chr_cp(':');
  Lcd_chr_cp((minute / 10) + 48);
  Lcd_chr_cp((minute % 10) + 48);
  delay_ms(3000);
  Lcd_Cmd(_LCD_CLEAR);
}

void addAlarm(char index, char hour, char minute, char d1, char d2, char d3){
  alarmaH[index] = hour;
  alarmaM[index] = minute;

  dispensers1[index] = d1;
  dispensers2[index] = d2;
  dispensers3[index] = d3;

  displayAddedAlarm(alarmaH[index], alarmaM[index]);
}

void updateSentinel(){
  LED_PORT = ++sentinel;
}

void displayTimeLCD(){
  segundos = Leer_DS1307(0xD0, 0);
  minutos = Leer_DS1307(0xD0, 1);
  hora = Leer_DS1307(0xD0, 2);
  dia_semana = Leer_DS1307(0xD0, 3);
  dia = Leer_DS1307(0xD0, 4);
  mes = Leer_DS1307(0xD0, 5);
  ano = Leer_DS1307(0xD0, 6);

  segundos = Bcd2Dec(segundos);
  minutos = Bcd2Dec(minutos);
  hora = Bcd2Dec(hora);
  dia_semana = Bcd2Dec(dia_semana);
  dia = Bcd2Dec(dia);
  mes = Bcd2Dec(mes);
  ano = Bcd2Dec(ano);

  Lcd_out(1, 1, "HORA: ");
  Lcd_chr_cp((hora / 10) + 48);
  Lcd_chr_cp((hora % 10) + 48);
  Lcd_chr_cp(':');
  Lcd_chr_cp((minutos / 10) + 48);
  Lcd_chr_cp((minutos % 10) + 48);
  Lcd_chr_cp(':');
  Lcd_chr_cp((segundos / 10) + 48);
  Lcd_chr_cp((segundos % 10) + 48);
}

void receiveAlarmsData()
{
  if (UART1_Data_Ready() == 1)
  {
    LED_PORT = 0xFF;
    UART1_Read_Text(&buffer, ";", 5);

    // LED_PORT = buffer[0];
    // delay_ms(1000);
    // LED_PORT = buffer[1];
    // delay_ms(1000);
    // LED_PORT = buffer[2];
    // delay_ms(1000);
   }

  if (strlen(buffer) > 0)
  {
    char index = ((buffer[0] >> 4) & 0x0F);

    char dispenserFlagOne = ((buffer[0] >> 1) & 0x0F);
    char dispenserFlagTwo = ((buffer[0] >> 2) & 0x0F);
    char dispenserFlagThree = ((buffer[0] >> 3) & 0x0F);

    char alarmHour = Bcd2Dec(buffer[1]);
    char alarmMinute = Bcd2Dec(buffer[2]);

    LED_PORT = 0x00;

    addAlarm(
        index,
        alarmHour,
        alarmMinute,
        dispenserFlagOne,
        dispenserFlagTwo,
        dispenserFlagThree
    );
  }
}

// ------ INITIALIZE FUNCIOTNS --------------

void soundBuzzer() {
  Sound_Play(1000, 500);
  Sound_Play(1000, 1000);
  delay_ms(1000);
}

void configurationBitsInitialization(){
  TRISC.RC3 = 1; // SCL como Input para DS1307
  TRISC.RC4 = 1; // SDA como Input para DS1307
  TRISC.RB2 = 0; // PIN RB2 Output para LED

  TRISB = 0;
  LED_PORT = 0;

  // Motores a 0 V
  LED_PORT.RB5 = 0;
  LED_PORT.RB4 = 0;
  LED_PORT.RB3 = 0;
}

void lcdInitialization(){
  Lcd_init();
  Lcd_cmd(12);
}

void ds1307Initialize(){
  // DS1307 Inicialización
  I2C1_Init(100000);
  set_datos_DS1307(segundos, minutos, hora, dia_semana, dia, mes, ano);
}

void buzzerInitialize(){
  // Inicialización Buzzer
  Sound_Init(&LED_PORT, 7);
}

void initRoutine()
{
  configurationBitsInitialization();

  lcdInitialization();

  ds1307Initialize();

  LED_PORT = 0b10101010;
  delay_ms(300);
  LED_PORT = 0b01010101;
  delay_ms(300);
  LED_PORT = 0b10101010;
  delay_ms(300);
  LED_PORT = 0b01010101;
  delay_ms(300);
  LED_PORT = 0;
}

// MAIN FUNCTION!!!!

void main() {

  initRoutine();


  // Inicialización UART BT
  UART1_Init(9600);
  delay_ms(100);

  // addAlarm(0, 16, 0, 1, 1, 0);

  while (1)
  {

    clearBuffer();
    displayTimeLCD();
    receiveAlarmsData();

    
    if (segundos == 0) {
      char i;

      for (i=0; i<10; i++) {
        
        if (alarmaH[i] == hora && alarmaM[i] == minutos) {
    
          LED_PORT.RB0 = dispensers1[i];
          LED_PORT.RB1 = dispensers2[i];
          LED_PORT.RB2 = dispensers3[i];
          LED_PORT.RB3 = 1;


          delay_ms(2000);
          // blinkLed();
          
          // servoM3Routine();
          // servoM2Routine();
          // servoM1Routine();
          // Envío de señal
          // Uart1_Write('1');

          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0;
          delay_ms(300);
          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0;
          delay_ms(300);
          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0b10101010;
          delay_ms(300);
          LED_PORT = 0b01010101;
          delay_ms(300);
          LED_PORT = 0;
          delay_ms(300);
        }
      }
    }
    
  }
}