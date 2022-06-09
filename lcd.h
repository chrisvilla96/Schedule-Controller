// LCD module connections
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
// End LCD module connections

/*
if (dia_semana == 0)
{
  dia_semana = 1;
  set_datos_DS1307(segundos, minutos, hora, dia_semana, dia, mes, ano);
}
*/

/*
switch (dia_semana)
{
case 1:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Lunes");
  break;
case 2:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Martes");
  break;
case 3:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Miercoles");
  break;
case 4:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Jueves");
  break;
case 5:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Viernes");
  break;
case 6:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Sabado");
  break;
case 7:
  Lcd_out(2, 1, "          ");
  Lcd_out(2, 1, "Domingo");
  break;
}
*/