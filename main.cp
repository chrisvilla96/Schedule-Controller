#line 1 "C:/Users/Chris/Documents/Graduation-Project/Final-Controller/Schedule-Controller/main.c"
#line 1 "c:/users/chris/documents/graduation-project/final-controller/schedule-controller/lcd.h"

sbit LCD_RS at RD0_bit;
sbit LCD_EN at RD1_bit;
sbit LCD_D4 at RD4_bit;
sbit LCD_D5 at RD5_bit;
sbit LCD_D6 at RD6_bit;
sbit LCD_D7 at RD7_bit;

sbit LCD_RS_Direction at TRISD0_bit;
sbit LCD_EN_Direction at TRISD1_bit;
sbit LCD_D4_Direction at TRISD4_bit;
sbit LCD_D5_Direction at TRISD5_bit;
sbit LCD_D6_Direction at TRISD6_bit;
sbit LCD_D7_Direction at TRISD7_bit;
#line 1 "c:/users/chris/documents/graduation-project/final-controller/schedule-controller/ds1307.h"

void escribir_datos_ds1307(unsigned char direccion_esclavo,
 unsigned char direccion_memoria,
 unsigned char dato)
{
 I2C1_Start();
 I2C1_Wr(direccion_esclavo);
 I2C1_Wr(direccion_memoria);
 I2C1_Wr(dato);
 I2C1_Stop();
}
int Leer_DS1307(unsigned char direccion_esclavo,
 unsigned char direccion_memoria)
{

 int valor;
 I2C1_Start();
 I2C1_Wr(direccion_esclavo);
 I2C1_Wr(direccion_memoria);
 I2C1_Repeated_Start();
 I2C1_Wr(direccion_esclavo + 1);
 valor = I2C1_Rd(0);
 I2C1_Stop();
 return valor;
}

void set_datos_ds1307(int segundos, int minutos, int horas,
 int dias, int semanas, int mes, int ano)
{
 int i;
 segundos = Dec2Bcd(segundos);
 minutos = Dec2Bcd(minutos);
 horas = Dec2Bcd(horas);
 dias = Dec2Bcd(dias);
 semanas = Dec2Bcd(semanas);
 mes = Dec2Bcd(mes);
 ano = Dec2Bcd(ano);
 for (i = 0; i <= 6; i++)
 {
 switch (i)
 {
 case 0:
 escribir_datos_ds1307(0xD0, i, segundos);
 break;
 case 1:
 escribir_datos_ds1307(0xD0, i, minutos);
 break;
 case 2:
 escribir_datos_ds1307(0xD0, i, horas);
 break;
 case 3:
 escribir_datos_ds1307(0xD0, i, dias);
 break;
 case 4:
 escribir_datos_ds1307(0xD0, i, semanas);
 break;
 case 5:
 escribir_datos_ds1307(0xD0, i, mes);
 break;
 case 6:
 escribir_datos_ds1307(0xD0, i, ano);
 break;
 }
 }
}
#line 1 "c:/users/chris/documents/graduation-project/final-controller/schedule-controller/motores.h"





void servoM3Rotate0()
{
  PORTB.RB7  = 1;
 Delay_us(1050);
  PORTB.RB7  = 0;
 Delay_us(18950);
}

void servoM3Rotate180()
{
  PORTB.RB7  = 1;
 Delay_us(2050);
  PORTB.RB7  = 0;
 Delay_us(17950);
}

void servoM3Rotate90()
{
  PORTB.RB7  = 1;
 Delay_us(1550);
  PORTB.RB7  = 0;
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



void servoM2Rotate0()
{
  PORTB.RB6  = 1;
 Delay_us(1050);
  PORTB.RB6  = 0;
 Delay_us(18950);
}

void servoM2Rotate180()
{
  PORTB.RB6  = 1;
 Delay_us(2050);
  PORTB.RB6  = 0;
 Delay_us(17950);
}

void servoM2Rotate90()
{
  PORTB.RB6  = 1;
 Delay_us(1550);
  PORTB.RB6  = 0;
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


void servoM1Rotate0()
{
  PORTB.RB5  = 1;
 Delay_us(1050);
  PORTB.RB5  = 0;
 Delay_us(18950);
}

void servoM1Rotate180()
{
  PORTB.RB5  = 1;
 Delay_us(2050);
  PORTB.RB5  = 0;
 Delay_us(17950);
}

void servoM1Rotate90()
{
  PORTB.RB5  = 1;
 Delay_us(1550);
  PORTB.RB5  = 0;
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
#line 9 "C:/Users/Chris/Documents/Graduation-Project/Final-Controller/Schedule-Controller/main.c"
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
  PORTB  = 0XFF;
 delay_ms(300);
  PORTB  = 0;
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
  PORTB  = ++sentinel;
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
  PORTB  = 0xFF;
 UART1_Read_Text(&buffer, ";", 5);







 }

 if (strlen(buffer) > 0)
 {
 char index = ((buffer[0] >> 4) & 0x0F);

 char dispenserFlagOne = ((buffer[0] >> 1) & 0x0F);
 char dispenserFlagTwo = ((buffer[0] >> 2) & 0x0F);
 char dispenserFlagThree = ((buffer[0] >> 3) & 0x0F);

 char alarmHour = Bcd2Dec(buffer[1]);
 char alarmMinute = Bcd2Dec(buffer[2]);

  PORTB  = 0x00;

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



void soundBuzzer() {
 Sound_Play(1000, 500);
 Sound_Play(1000, 1000);
 delay_ms(1000);
}

void configurationBitsInitialization(){
 TRISC.RC3 = 1;
 TRISC.RC4 = 1;
 TRISC.RB2 = 0;

 TRISB = 0;
  PORTB  = 0;


  PORTB .RB5 = 0;
  PORTB .RB4 = 0;
  PORTB .RB3 = 0;
}

void lcdInitialization(){
 Lcd_init();
 Lcd_cmd(12);
}

void ds1307Initialize(){

 I2C1_Init(100000);
 set_datos_DS1307(segundos, minutos, hora, dia_semana, dia, mes, ano);
}

void buzzerInitialize(){

 Sound_Init(& PORTB , 7);
}

void initRoutine()
{
 configurationBitsInitialization();

 lcdInitialization();

 ds1307Initialize();

  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0;
}



void main() {

 initRoutine();



 UART1_Init(9600);
 delay_ms(100);



 while (1)
 {

 clearBuffer();
 displayTimeLCD();
 receiveAlarmsData();


 if (segundos == 0) {
 char i;

 for (i=0; i<10; i++) {

 if (alarmaH[i] == hora && alarmaM[i] == minutos) {

  PORTB .RB0 = dispensers1[i];
  PORTB .RB1 = dispensers2[i];
  PORTB .RB2 = dispensers3[i];
  PORTB .RB3 = 1;


 delay_ms(2000);








  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0b10101010;
 delay_ms(300);
  PORTB  = 0b01010101;
 delay_ms(300);
  PORTB  = 0;
 delay_ms(300);
 }
 }
 }

 }
}
