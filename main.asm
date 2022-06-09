
_escribir_datos_ds1307:

;ds1307.h,4 :: 		unsigned char dato)
;ds1307.h,6 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;ds1307.h,7 :: 		I2C1_Wr(direccion_esclavo);
	MOVF       FARG_escribir_datos_ds1307_direccion_esclavo+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,8 :: 		I2C1_Wr(direccion_memoria); // MEMORIA L
	MOVF       FARG_escribir_datos_ds1307_direccion_memoria+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,9 :: 		I2C1_Wr(dato);              // DATO
	MOVF       FARG_escribir_datos_ds1307_dato+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,10 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;ds1307.h,11 :: 		}
L_end_escribir_datos_ds1307:
	RETURN
; end of _escribir_datos_ds1307

_Leer_DS1307:

;ds1307.h,13 :: 		unsigned char direccion_memoria)
;ds1307.h,17 :: 		I2C1_Start();
	CALL       _I2C1_Start+0
;ds1307.h,18 :: 		I2C1_Wr(direccion_esclavo);
	MOVF       FARG_Leer_DS1307_direccion_esclavo+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,19 :: 		I2C1_Wr(direccion_memoria); // MEMORIA L
	MOVF       FARG_Leer_DS1307_direccion_memoria+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,20 :: 		I2C1_Repeated_Start();
	CALL       _I2C1_Repeated_Start+0
;ds1307.h,21 :: 		I2C1_Wr(direccion_esclavo + 1);
	INCF       FARG_Leer_DS1307_direccion_esclavo+0, 0
	MOVWF      FARG_I2C1_Wr_data_+0
	CALL       _I2C1_Wr+0
;ds1307.h,22 :: 		valor = I2C1_Rd(0);
	CLRF       FARG_I2C1_Rd_ack+0
	CALL       _I2C1_Rd+0
	MOVF       R0+0, 0
	MOVWF      Leer_DS1307_valor_L0+0
	CLRF       Leer_DS1307_valor_L0+1
;ds1307.h,23 :: 		I2C1_Stop();
	CALL       _I2C1_Stop+0
;ds1307.h,24 :: 		return valor;
	MOVF       Leer_DS1307_valor_L0+0, 0
	MOVWF      R0+0
	MOVF       Leer_DS1307_valor_L0+1, 0
	MOVWF      R0+1
;ds1307.h,25 :: 		}
L_end_Leer_DS1307:
	RETURN
; end of _Leer_DS1307

_set_datos_ds1307:

;ds1307.h,28 :: 		int dias, int semanas, int mes, int ano)
;ds1307.h,31 :: 		segundos = Dec2Bcd(segundos);
	MOVF       FARG_set_datos_ds1307_segundos+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_segundos+0
	CLRF       FARG_set_datos_ds1307_segundos+1
;ds1307.h,32 :: 		minutos = Dec2Bcd(minutos);
	MOVF       FARG_set_datos_ds1307_minutos+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_minutos+0
	CLRF       FARG_set_datos_ds1307_minutos+1
;ds1307.h,33 :: 		horas = Dec2Bcd(horas);
	MOVF       FARG_set_datos_ds1307_horas+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_horas+0
	CLRF       FARG_set_datos_ds1307_horas+1
;ds1307.h,34 :: 		dias = Dec2Bcd(dias);
	MOVF       FARG_set_datos_ds1307_dias+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_dias+0
	CLRF       FARG_set_datos_ds1307_dias+1
;ds1307.h,35 :: 		semanas = Dec2Bcd(semanas);
	MOVF       FARG_set_datos_ds1307_semanas+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_semanas+0
	CLRF       FARG_set_datos_ds1307_semanas+1
;ds1307.h,36 :: 		mes = Dec2Bcd(mes);
	MOVF       FARG_set_datos_ds1307_mes+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_mes+0
	CLRF       FARG_set_datos_ds1307_mes+1
;ds1307.h,37 :: 		ano = Dec2Bcd(ano);
	MOVF       FARG_set_datos_ds1307_ano+0, 0
	MOVWF      FARG_Dec2Bcd_decnum+0
	CALL       _Dec2Bcd+0
	MOVF       R0+0, 0
	MOVWF      FARG_set_datos_ds1307_ano+0
	CLRF       FARG_set_datos_ds1307_ano+1
;ds1307.h,38 :: 		for (i = 0; i <= 6; i++)
	CLRF       set_datos_ds1307_i_L0+0
	CLRF       set_datos_ds1307_i_L0+1
L_set_datos_ds13070:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      set_datos_ds1307_i_L0+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130791
	MOVF       set_datos_ds1307_i_L0+0, 0
	SUBLW      6
L__set_datos_ds130791:
	BTFSS      STATUS+0, 0
	GOTO       L_set_datos_ds13071
;ds1307.h,40 :: 		switch (i)
	GOTO       L_set_datos_ds13073
;ds1307.h,42 :: 		case 0:
L_set_datos_ds13075:
;ds1307.h,43 :: 		escribir_datos_ds1307(0xD0, i, segundos);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_segundos+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,44 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,45 :: 		case 1:
L_set_datos_ds13076:
;ds1307.h,46 :: 		escribir_datos_ds1307(0xD0, i, minutos);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_minutos+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,47 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,48 :: 		case 2:
L_set_datos_ds13077:
;ds1307.h,49 :: 		escribir_datos_ds1307(0xD0, i, horas);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_horas+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,50 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,51 :: 		case 3:
L_set_datos_ds13078:
;ds1307.h,52 :: 		escribir_datos_ds1307(0xD0, i, dias);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_dias+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,53 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,54 :: 		case 4:
L_set_datos_ds13079:
;ds1307.h,55 :: 		escribir_datos_ds1307(0xD0, i, semanas);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_semanas+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,56 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,57 :: 		case 5:
L_set_datos_ds130710:
;ds1307.h,58 :: 		escribir_datos_ds1307(0xD0, i, mes);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_mes+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,59 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,60 :: 		case 6:
L_set_datos_ds130711:
;ds1307.h,61 :: 		escribir_datos_ds1307(0xD0, i, ano);
	MOVLW      208
	MOVWF      FARG_escribir_datos_ds1307_direccion_esclavo+0
	MOVF       set_datos_ds1307_i_L0+0, 0
	MOVWF      FARG_escribir_datos_ds1307_direccion_memoria+0
	MOVF       FARG_set_datos_ds1307_ano+0, 0
	MOVWF      FARG_escribir_datos_ds1307_dato+0
	CALL       _escribir_datos_ds1307+0
;ds1307.h,62 :: 		break;
	GOTO       L_set_datos_ds13074
;ds1307.h,63 :: 		}
L_set_datos_ds13073:
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130792
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130792:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds13075
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130793
	MOVLW      1
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130793:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds13076
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130794
	MOVLW      2
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130794:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds13077
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130795
	MOVLW      3
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130795:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds13078
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130796
	MOVLW      4
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130796:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds13079
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130797
	MOVLW      5
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130797:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds130710
	MOVLW      0
	XORWF      set_datos_ds1307_i_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_datos_ds130798
	MOVLW      6
	XORWF      set_datos_ds1307_i_L0+0, 0
L__set_datos_ds130798:
	BTFSC      STATUS+0, 2
	GOTO       L_set_datos_ds130711
L_set_datos_ds13074:
;ds1307.h,38 :: 		for (i = 0; i <= 6; i++)
	INCF       set_datos_ds1307_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       set_datos_ds1307_i_L0+1, 1
;ds1307.h,64 :: 		}
	GOTO       L_set_datos_ds13070
L_set_datos_ds13071:
;ds1307.h,65 :: 		}
L_end_set_datos_ds1307:
	RETURN
; end of _set_datos_ds1307

_servoM3Rotate0:

;motores.h,6 :: 		void servoM3Rotate0()
;motores.h,8 :: 		M3 = 1;
	BSF        PORTB+0, 7
;motores.h,9 :: 		Delay_us(1050);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      185
	MOVWF      R13+0
L_servoM3Rotate012:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate012
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate012
;motores.h,10 :: 		M3 = 0;
	BCF        PORTB+0, 7
;motores.h,11 :: 		Delay_us(18950);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      55
	MOVWF      R13+0
L_servoM3Rotate013:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate013
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate013
;motores.h,12 :: 		}
L_end_servoM3Rotate0:
	RETURN
; end of _servoM3Rotate0

_servoM3Rotate180:

;motores.h,14 :: 		void servoM3Rotate180()
;motores.h,16 :: 		M3 = 1;
	BSF        PORTB+0, 7
;motores.h,17 :: 		Delay_us(2050);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      81
	MOVWF      R13+0
L_servoM3Rotate18014:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate18014
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate18014
	NOP
	NOP
;motores.h,18 :: 		M3 = 0;
	BCF        PORTB+0, 7
;motores.h,19 :: 		Delay_us(17950);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      158
	MOVWF      R13+0
L_servoM3Rotate18015:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate18015
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate18015
	NOP
;motores.h,20 :: 		}
L_end_servoM3Rotate180:
	RETURN
; end of _servoM3Rotate180

_servoM3Rotate90:

;motores.h,22 :: 		void servoM3Rotate90()
;motores.h,24 :: 		M3 = 1;
	BSF        PORTB+0, 7
;motores.h,25 :: 		Delay_us(1550);
	MOVLW      5
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servoM3Rotate9016:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate9016
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate9016
;motores.h,26 :: 		M3 = 0;
	BCF        PORTB+0, 7
;motores.h,27 :: 		Delay_us(18450);
	MOVLW      48
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_servoM3Rotate9017:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Rotate9017
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Rotate9017
;motores.h,28 :: 		}
L_end_servoM3Rotate90:
	RETURN
; end of _servoM3Rotate90

_servoM3Routine:

;motores.h,30 :: 		void servoM3Routine()
;motores.h,32 :: 		servoM3Rotate0();
	CALL       _servoM3Rotate0+0
;motores.h,33 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine18:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine18
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine18
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine18
	NOP
	NOP
;motores.h,34 :: 		servoM3Rotate90();
	CALL       _servoM3Rotate90+0
;motores.h,35 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine19:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine19
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine19
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine19
	NOP
	NOP
;motores.h,36 :: 		servoM3Rotate0();
	CALL       _servoM3Rotate0+0
;motores.h,37 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine20:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine20
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine20
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine20
	NOP
	NOP
;motores.h,38 :: 		servoM3Rotate90();
	CALL       _servoM3Rotate90+0
;motores.h,39 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine21:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine21
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine21
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine21
	NOP
	NOP
;motores.h,40 :: 		servoM3Rotate0();
	CALL       _servoM3Rotate0+0
;motores.h,41 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine22:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine22
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine22
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine22
	NOP
	NOP
;motores.h,42 :: 		servoM3Rotate180();
	CALL       _servoM3Rotate180+0
;motores.h,43 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM3Routine23:
	DECFSZ     R13+0, 1
	GOTO       L_servoM3Routine23
	DECFSZ     R12+0, 1
	GOTO       L_servoM3Routine23
	DECFSZ     R11+0, 1
	GOTO       L_servoM3Routine23
	NOP
	NOP
;motores.h,44 :: 		}
L_end_servoM3Routine:
	RETURN
; end of _servoM3Routine

_servoM2Rotate0:

;motores.h,48 :: 		void servoM2Rotate0()
;motores.h,50 :: 		M2 = 1;
	BSF        PORTB+0, 6
;motores.h,51 :: 		Delay_us(1050);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      185
	MOVWF      R13+0
L_servoM2Rotate024:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate024
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate024
;motores.h,52 :: 		M2 = 0;
	BCF        PORTB+0, 6
;motores.h,53 :: 		Delay_us(18950);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      55
	MOVWF      R13+0
L_servoM2Rotate025:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate025
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate025
;motores.h,54 :: 		}
L_end_servoM2Rotate0:
	RETURN
; end of _servoM2Rotate0

_servoM2Rotate180:

;motores.h,56 :: 		void servoM2Rotate180()
;motores.h,58 :: 		M2 = 1;
	BSF        PORTB+0, 6
;motores.h,59 :: 		Delay_us(2050);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      81
	MOVWF      R13+0
L_servoM2Rotate18026:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate18026
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate18026
	NOP
	NOP
;motores.h,60 :: 		M2 = 0;
	BCF        PORTB+0, 6
;motores.h,61 :: 		Delay_us(17950);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      158
	MOVWF      R13+0
L_servoM2Rotate18027:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate18027
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate18027
	NOP
;motores.h,62 :: 		}
L_end_servoM2Rotate180:
	RETURN
; end of _servoM2Rotate180

_servoM2Rotate90:

;motores.h,64 :: 		void servoM2Rotate90()
;motores.h,66 :: 		M2 = 1;
	BSF        PORTB+0, 6
;motores.h,67 :: 		Delay_us(1550);
	MOVLW      5
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servoM2Rotate9028:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate9028
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate9028
;motores.h,68 :: 		M2 = 0;
	BCF        PORTB+0, 6
;motores.h,69 :: 		Delay_us(18450);
	MOVLW      48
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_servoM2Rotate9029:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Rotate9029
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Rotate9029
;motores.h,70 :: 		}
L_end_servoM2Rotate90:
	RETURN
; end of _servoM2Rotate90

_servoM2Routine:

;motores.h,72 :: 		void servoM2Routine()
;motores.h,74 :: 		servoM2Rotate0();
	CALL       _servoM2Rotate0+0
;motores.h,75 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine30:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine30
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine30
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine30
	NOP
	NOP
;motores.h,76 :: 		servoM2Rotate90();
	CALL       _servoM2Rotate90+0
;motores.h,77 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine31:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine31
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine31
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine31
	NOP
	NOP
;motores.h,78 :: 		servoM2Rotate0();
	CALL       _servoM2Rotate0+0
;motores.h,79 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine32:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine32
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine32
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine32
	NOP
	NOP
;motores.h,80 :: 		servoM2Rotate90();
	CALL       _servoM2Rotate90+0
;motores.h,81 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine33:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine33
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine33
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine33
	NOP
	NOP
;motores.h,82 :: 		servoM2Rotate0();
	CALL       _servoM2Rotate0+0
;motores.h,83 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine34:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine34
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine34
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine34
	NOP
	NOP
;motores.h,84 :: 		servoM2Rotate180();
	CALL       _servoM2Rotate180+0
;motores.h,85 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM2Routine35:
	DECFSZ     R13+0, 1
	GOTO       L_servoM2Routine35
	DECFSZ     R12+0, 1
	GOTO       L_servoM2Routine35
	DECFSZ     R11+0, 1
	GOTO       L_servoM2Routine35
	NOP
	NOP
;motores.h,86 :: 		}
L_end_servoM2Routine:
	RETURN
; end of _servoM2Routine

_servoM1Rotate0:

;motores.h,89 :: 		void servoM1Rotate0()
;motores.h,91 :: 		M1 = 1;
	BSF        PORTB+0, 5
;motores.h,92 :: 		Delay_us(1050);
	MOVLW      3
	MOVWF      R12+0
	MOVLW      185
	MOVWF      R13+0
L_servoM1Rotate036:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate036
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate036
;motores.h,93 :: 		M1 = 0;
	BCF        PORTB+0, 5
;motores.h,94 :: 		Delay_us(18950);
	MOVLW      50
	MOVWF      R12+0
	MOVLW      55
	MOVWF      R13+0
L_servoM1Rotate037:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate037
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate037
;motores.h,95 :: 		}
L_end_servoM1Rotate0:
	RETURN
; end of _servoM1Rotate0

_servoM1Rotate180:

;motores.h,97 :: 		void servoM1Rotate180()
;motores.h,99 :: 		M1 = 1;
	BSF        PORTB+0, 5
;motores.h,100 :: 		Delay_us(2050);
	MOVLW      6
	MOVWF      R12+0
	MOVLW      81
	MOVWF      R13+0
L_servoM1Rotate18038:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate18038
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate18038
	NOP
	NOP
;motores.h,101 :: 		M1 = 0;
	BCF        PORTB+0, 5
;motores.h,102 :: 		Delay_us(17950);
	MOVLW      47
	MOVWF      R12+0
	MOVLW      158
	MOVWF      R13+0
L_servoM1Rotate18039:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate18039
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate18039
	NOP
;motores.h,103 :: 		}
L_end_servoM1Rotate180:
	RETURN
; end of _servoM1Rotate180

_servoM1Rotate90:

;motores.h,105 :: 		void servoM1Rotate90()
;motores.h,107 :: 		M1 = 1;
	BSF        PORTB+0, 5
;motores.h,108 :: 		Delay_us(1550);
	MOVLW      5
	MOVWF      R12+0
	MOVLW      5
	MOVWF      R13+0
L_servoM1Rotate9040:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate9040
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate9040
;motores.h,109 :: 		M1 = 0;
	BCF        PORTB+0, 5
;motores.h,110 :: 		Delay_us(18450);
	MOVLW      48
	MOVWF      R12+0
	MOVLW      235
	MOVWF      R13+0
L_servoM1Rotate9041:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Rotate9041
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Rotate9041
;motores.h,111 :: 		}
L_end_servoM1Rotate90:
	RETURN
; end of _servoM1Rotate90

_servoM1Routine:

;motores.h,113 :: 		void servoM1Routine()
;motores.h,115 :: 		servoM1Rotate0();
	CALL       _servoM1Rotate0+0
;motores.h,116 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine42:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine42
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine42
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine42
	NOP
	NOP
;motores.h,117 :: 		servoM1Rotate90();
	CALL       _servoM1Rotate90+0
;motores.h,118 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine43:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine43
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine43
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine43
	NOP
	NOP
;motores.h,119 :: 		servoM1Rotate0();
	CALL       _servoM1Rotate0+0
;motores.h,120 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine44:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine44
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine44
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine44
	NOP
	NOP
;motores.h,121 :: 		servoM1Rotate90();
	CALL       _servoM1Rotate90+0
;motores.h,122 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine45:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine45
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine45
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine45
	NOP
	NOP
;motores.h,123 :: 		servoM1Rotate0();
	CALL       _servoM1Rotate0+0
;motores.h,124 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine46:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine46
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine46
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine46
	NOP
	NOP
;motores.h,125 :: 		servoM1Rotate180();
	CALL       _servoM1Rotate180+0
;motores.h,126 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_servoM1Routine47:
	DECFSZ     R13+0, 1
	GOTO       L_servoM1Routine47
	DECFSZ     R12+0, 1
	GOTO       L_servoM1Routine47
	DECFSZ     R11+0, 1
	GOTO       L_servoM1Routine47
	NOP
	NOP
;motores.h,127 :: 		}
L_end_servoM1Routine:
	RETURN
; end of _servoM1Routine

_blinkAllLED:

;main.c,21 :: 		void blinkAllLED() {
;main.c,23 :: 		for(i=0; i<2; i++){
	CLRF       R1+0
L_blinkAllLED48:
	MOVLW      2
	SUBWF      R1+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_blinkAllLED49
;main.c,24 :: 		LED_PORT = 0XFF;
	MOVLW      255
	MOVWF      PORTB+0
;main.c,25 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_blinkAllLED51:
	DECFSZ     R13+0, 1
	GOTO       L_blinkAllLED51
	DECFSZ     R12+0, 1
	GOTO       L_blinkAllLED51
	DECFSZ     R11+0, 1
	GOTO       L_blinkAllLED51
	NOP
	NOP
;main.c,26 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,27 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_blinkAllLED52:
	DECFSZ     R13+0, 1
	GOTO       L_blinkAllLED52
	DECFSZ     R12+0, 1
	GOTO       L_blinkAllLED52
	DECFSZ     R11+0, 1
	GOTO       L_blinkAllLED52
	NOP
	NOP
;main.c,23 :: 		for(i=0; i<2; i++){
	INCF       R1+0, 1
;main.c,28 :: 		}
	GOTO       L_blinkAllLED48
L_blinkAllLED49:
;main.c,29 :: 		}
L_end_blinkAllLED:
	RETURN
; end of _blinkAllLED

_clearBuffer:

;main.c,31 :: 		void clearBuffer()
;main.c,33 :: 		buffer[0] = '\0';
	CLRF       _buffer+0
;main.c,34 :: 		buffer[1] = '\0';
	CLRF       _buffer+1
;main.c,35 :: 		buffer[2] = '\0';
	CLRF       _buffer+2
;main.c,36 :: 		buffer[3] = '\0';
	CLRF       _buffer+3
;main.c,37 :: 		}
L_end_clearBuffer:
	RETURN
; end of _clearBuffer

_displayAddedAlarm:

;main.c,39 :: 		void displayAddedAlarm(char hour, char minute)
;main.c,41 :: 		Lcd_out(1, 1, "Alarma:         ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_main+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;main.c,42 :: 		Lcd_out(2, 1, "H: ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_main+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;main.c,43 :: 		Lcd_chr_cp((hour / 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_displayAddedAlarm_hour+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,44 :: 		Lcd_chr_cp((hour % 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_displayAddedAlarm_hour+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,45 :: 		Lcd_chr_cp(':');
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,46 :: 		Lcd_chr_cp((minute / 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_displayAddedAlarm_minute+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,47 :: 		Lcd_chr_cp((minute % 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       FARG_displayAddedAlarm_minute+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,48 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_displayAddedAlarm53:
	DECFSZ     R13+0, 1
	GOTO       L_displayAddedAlarm53
	DECFSZ     R12+0, 1
	GOTO       L_displayAddedAlarm53
	DECFSZ     R11+0, 1
	GOTO       L_displayAddedAlarm53
	NOP
;main.c,49 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;main.c,50 :: 		}
L_end_displayAddedAlarm:
	RETURN
; end of _displayAddedAlarm

_addAlarm:

;main.c,52 :: 		void addAlarm(char index, char hour, char minute, char d1, char d2, char d3){
;main.c,53 :: 		alarmaH[index] = hour;
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _alarmaH+0
	MOVWF      FSR
	MOVF       FARG_addAlarm_hour+0, 0
	MOVWF      INDF+0
;main.c,54 :: 		alarmaM[index] = minute;
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _alarmaM+0
	MOVWF      FSR
	MOVF       FARG_addAlarm_minute+0, 0
	MOVWF      INDF+0
;main.c,56 :: 		dispensers1[index] = d1;
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _dispensers1+0
	MOVWF      FSR
	MOVF       FARG_addAlarm_d1+0, 0
	MOVWF      INDF+0
;main.c,57 :: 		dispensers2[index] = d2;
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _dispensers2+0
	MOVWF      FSR
	MOVF       FARG_addAlarm_d2+0, 0
	MOVWF      INDF+0
;main.c,58 :: 		dispensers3[index] = d3;
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _dispensers3+0
	MOVWF      FSR
	MOVF       FARG_addAlarm_d3+0, 0
	MOVWF      INDF+0
;main.c,60 :: 		displayAddedAlarm(alarmaH[index], alarmaM[index]);
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _alarmaH+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_displayAddedAlarm_hour+0
	MOVF       FARG_addAlarm_index+0, 0
	ADDLW      _alarmaM+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      FARG_displayAddedAlarm_minute+0
	CALL       _displayAddedAlarm+0
;main.c,61 :: 		}
L_end_addAlarm:
	RETURN
; end of _addAlarm

_updateSentinel:

;main.c,63 :: 		void updateSentinel(){
;main.c,64 :: 		LED_PORT = ++sentinel;
	INCF       _sentinel+0, 1
	MOVF       _sentinel+0, 0
	MOVWF      PORTB+0
;main.c,65 :: 		}
L_end_updateSentinel:
	RETURN
; end of _updateSentinel

_displayTimeLCD:

;main.c,67 :: 		void displayTimeLCD(){
;main.c,68 :: 		segundos = Leer_DS1307(0xD0, 0);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	CLRF       FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _segundos+0
;main.c,69 :: 		minutos = Leer_DS1307(0xD0, 1);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      1
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _minutos+0
;main.c,70 :: 		hora = Leer_DS1307(0xD0, 2);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      2
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _hora+0
;main.c,71 :: 		dia_semana = Leer_DS1307(0xD0, 3);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      3
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _dia_semana+0
;main.c,72 :: 		dia = Leer_DS1307(0xD0, 4);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      4
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _dia+0
;main.c,73 :: 		mes = Leer_DS1307(0xD0, 5);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      5
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _mes+0
;main.c,74 :: 		ano = Leer_DS1307(0xD0, 6);
	MOVLW      208
	MOVWF      FARG_Leer_DS1307_direccion_esclavo+0
	MOVLW      6
	MOVWF      FARG_Leer_DS1307_direccion_memoria+0
	CALL       _Leer_DS1307+0
	MOVF       R0+0, 0
	MOVWF      _ano+0
;main.c,76 :: 		segundos = Bcd2Dec(segundos);
	MOVF       _segundos+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _segundos+0
;main.c,77 :: 		minutos = Bcd2Dec(minutos);
	MOVF       _minutos+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _minutos+0
;main.c,78 :: 		hora = Bcd2Dec(hora);
	MOVF       _hora+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _hora+0
;main.c,79 :: 		dia_semana = Bcd2Dec(dia_semana);
	MOVF       _dia_semana+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _dia_semana+0
;main.c,80 :: 		dia = Bcd2Dec(dia);
	MOVF       _dia+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _dia+0
;main.c,81 :: 		mes = Bcd2Dec(mes);
	MOVF       _mes+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _mes+0
;main.c,82 :: 		ano = Bcd2Dec(ano);
	MOVF       _ano+0, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      _ano+0
;main.c,84 :: 		Lcd_out(1, 1, "HORA: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_main+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;main.c,85 :: 		Lcd_chr_cp((hora / 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hora+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,86 :: 		Lcd_chr_cp((hora % 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _hora+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,87 :: 		Lcd_chr_cp(':');
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,88 :: 		Lcd_chr_cp((minutos / 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutos+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,89 :: 		Lcd_chr_cp((minutos % 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _minutos+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,90 :: 		Lcd_chr_cp(':');
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,91 :: 		Lcd_chr_cp((segundos / 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _segundos+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,92 :: 		Lcd_chr_cp((segundos % 10) + 48);
	MOVLW      10
	MOVWF      R4+0
	MOVF       _segundos+0, 0
	MOVWF      R0+0
	CALL       _Div_8X8_U+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;main.c,93 :: 		}
L_end_displayTimeLCD:
	RETURN
; end of _displayTimeLCD

_receiveAlarmsData:

;main.c,95 :: 		void receiveAlarmsData()
;main.c,97 :: 		if (UART1_Data_Ready() == 1)
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_receiveAlarmsData54
;main.c,99 :: 		LED_PORT = 0xFF;
	MOVLW      255
	MOVWF      PORTB+0
;main.c,100 :: 		UART1_Read_Text(&buffer, ";", 5);
	MOVLW      _buffer+0
	MOVWF      FARG_UART1_Read_Text_Output+0
	MOVLW      ?lstr4_main+0
	MOVWF      FARG_UART1_Read_Text_Delimiter+0
	MOVLW      5
	MOVWF      FARG_UART1_Read_Text_Attempts+0
	CALL       _UART1_Read_Text+0
;main.c,108 :: 		}
L_receiveAlarmsData54:
;main.c,110 :: 		if (strlen(buffer) > 0)
	MOVLW      _buffer+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__receiveAlarmsData118
	MOVF       R0+0, 0
	SUBLW      0
L__receiveAlarmsData118:
	BTFSC      STATUS+0, 0
	GOTO       L_receiveAlarmsData55
;main.c,112 :: 		char index = ((buffer[0] >> 4) & 0x0F);
	MOVF       _buffer+0, 0
	MOVWF      receiveAlarmsData_index_L1+0
	RRF        receiveAlarmsData_index_L1+0, 1
	BCF        receiveAlarmsData_index_L1+0, 7
	RRF        receiveAlarmsData_index_L1+0, 1
	BCF        receiveAlarmsData_index_L1+0, 7
	RRF        receiveAlarmsData_index_L1+0, 1
	BCF        receiveAlarmsData_index_L1+0, 7
	RRF        receiveAlarmsData_index_L1+0, 1
	BCF        receiveAlarmsData_index_L1+0, 7
	MOVLW      15
	ANDWF      receiveAlarmsData_index_L1+0, 1
;main.c,114 :: 		char dispenserFlagOne = ((buffer[0] >> 1) & 0x0F);
	MOVF       _buffer+0, 0
	MOVWF      receiveAlarmsData_dispenserFlagOne_L1+0
	RRF        receiveAlarmsData_dispenserFlagOne_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagOne_L1+0, 7
	MOVLW      15
	ANDWF      receiveAlarmsData_dispenserFlagOne_L1+0, 1
;main.c,115 :: 		char dispenserFlagTwo = ((buffer[0] >> 2) & 0x0F);
	MOVF       _buffer+0, 0
	MOVWF      receiveAlarmsData_dispenserFlagTwo_L1+0
	RRF        receiveAlarmsData_dispenserFlagTwo_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagTwo_L1+0, 7
	RRF        receiveAlarmsData_dispenserFlagTwo_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagTwo_L1+0, 7
	MOVLW      15
	ANDWF      receiveAlarmsData_dispenserFlagTwo_L1+0, 1
;main.c,116 :: 		char dispenserFlagThree = ((buffer[0] >> 3) & 0x0F);
	MOVF       _buffer+0, 0
	MOVWF      receiveAlarmsData_dispenserFlagThree_L1+0
	RRF        receiveAlarmsData_dispenserFlagThree_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagThree_L1+0, 7
	RRF        receiveAlarmsData_dispenserFlagThree_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagThree_L1+0, 7
	RRF        receiveAlarmsData_dispenserFlagThree_L1+0, 1
	BCF        receiveAlarmsData_dispenserFlagThree_L1+0, 7
	MOVLW      15
	ANDWF      receiveAlarmsData_dispenserFlagThree_L1+0, 1
;main.c,118 :: 		char alarmHour = Bcd2Dec(buffer[1]);
	MOVF       _buffer+1, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
	MOVF       R0+0, 0
	MOVWF      receiveAlarmsData_alarmHour_L1+0
;main.c,119 :: 		char alarmMinute = Bcd2Dec(buffer[2]);
	MOVF       _buffer+2, 0
	MOVWF      FARG_Bcd2Dec_bcdnum+0
	CALL       _Bcd2Dec+0
;main.c,121 :: 		LED_PORT = 0x00;
	CLRF       PORTB+0
;main.c,124 :: 		index,
	MOVF       receiveAlarmsData_index_L1+0, 0
	MOVWF      FARG_addAlarm_index+0
;main.c,125 :: 		alarmHour,
	MOVF       receiveAlarmsData_alarmHour_L1+0, 0
	MOVWF      FARG_addAlarm_hour+0
;main.c,126 :: 		alarmMinute,
	MOVF       R0+0, 0
	MOVWF      FARG_addAlarm_minute+0
;main.c,127 :: 		dispenserFlagOne,
	MOVF       receiveAlarmsData_dispenserFlagOne_L1+0, 0
	MOVWF      FARG_addAlarm_d1+0
;main.c,128 :: 		dispenserFlagTwo,
	MOVF       receiveAlarmsData_dispenserFlagTwo_L1+0, 0
	MOVWF      FARG_addAlarm_d2+0
;main.c,129 :: 		dispenserFlagThree
	MOVF       receiveAlarmsData_dispenserFlagThree_L1+0, 0
	MOVWF      FARG_addAlarm_d3+0
	CALL       _addAlarm+0
;main.c,131 :: 		}
L_receiveAlarmsData55:
;main.c,132 :: 		}
L_end_receiveAlarmsData:
	RETURN
; end of _receiveAlarmsData

_soundBuzzer:

;main.c,136 :: 		void soundBuzzer() {
;main.c,137 :: 		Sound_Play(1000, 500);
	MOVLW      232
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      244
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      1
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;main.c,138 :: 		Sound_Play(1000, 1000);
	MOVLW      232
	MOVWF      FARG_Sound_Play_freq_in_hz+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_freq_in_hz+1
	MOVLW      232
	MOVWF      FARG_Sound_Play_duration_ms+0
	MOVLW      3
	MOVWF      FARG_Sound_Play_duration_ms+1
	CALL       _Sound_Play+0
;main.c,139 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_soundBuzzer56:
	DECFSZ     R13+0, 1
	GOTO       L_soundBuzzer56
	DECFSZ     R12+0, 1
	GOTO       L_soundBuzzer56
	DECFSZ     R11+0, 1
	GOTO       L_soundBuzzer56
	NOP
	NOP
;main.c,140 :: 		}
L_end_soundBuzzer:
	RETURN
; end of _soundBuzzer

_configurationBitsInitialization:

;main.c,142 :: 		void configurationBitsInitialization(){
;main.c,143 :: 		TRISC.RC3 = 1; // SCL como Input para DS1307
	BSF        TRISC+0, 3
;main.c,144 :: 		TRISC.RC4 = 1; // SDA como Input para DS1307
	BSF        TRISC+0, 4
;main.c,145 :: 		TRISC.RB2 = 0; // PIN RB2 Output para LED
	BCF        TRISC+0, 2
;main.c,147 :: 		TRISB = 0;
	CLRF       TRISB+0
;main.c,148 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,151 :: 		LED_PORT.RB5 = 0;
	BCF        PORTB+0, 5
;main.c,152 :: 		LED_PORT.RB4 = 0;
	BCF        PORTB+0, 4
;main.c,153 :: 		LED_PORT.RB3 = 0;
	BCF        PORTB+0, 3
;main.c,154 :: 		}
L_end_configurationBitsInitialization:
	RETURN
; end of _configurationBitsInitialization

_lcdInitialization:

;main.c,156 :: 		void lcdInitialization(){
;main.c,157 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;main.c,158 :: 		Lcd_cmd(12);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;main.c,159 :: 		}
L_end_lcdInitialization:
	RETURN
; end of _lcdInitialization

_ds1307Initialize:

;main.c,161 :: 		void ds1307Initialize(){
;main.c,163 :: 		I2C1_Init(100000);
	MOVLW      20
	MOVWF      SSPADD+0
	CALL       _I2C1_Init+0
;main.c,164 :: 		set_datos_DS1307(segundos, minutos, hora, dia_semana, dia, mes, ano);
	MOVF       _segundos+0, 0
	MOVWF      FARG_set_datos_ds1307_segundos+0
	CLRF       FARG_set_datos_ds1307_segundos+1
	MOVF       _minutos+0, 0
	MOVWF      FARG_set_datos_ds1307_minutos+0
	CLRF       FARG_set_datos_ds1307_minutos+1
	MOVF       _hora+0, 0
	MOVWF      FARG_set_datos_ds1307_horas+0
	CLRF       FARG_set_datos_ds1307_horas+1
	MOVF       _dia_semana+0, 0
	MOVWF      FARG_set_datos_ds1307_dias+0
	CLRF       FARG_set_datos_ds1307_dias+1
	MOVF       _dia+0, 0
	MOVWF      FARG_set_datos_ds1307_semanas+0
	CLRF       FARG_set_datos_ds1307_semanas+1
	MOVF       _mes+0, 0
	MOVWF      FARG_set_datos_ds1307_mes+0
	CLRF       FARG_set_datos_ds1307_mes+1
	MOVF       _ano+0, 0
	MOVWF      FARG_set_datos_ds1307_ano+0
	CLRF       FARG_set_datos_ds1307_ano+1
	CALL       _set_datos_ds1307+0
;main.c,165 :: 		}
L_end_ds1307Initialize:
	RETURN
; end of _ds1307Initialize

_buzzerInitialize:

;main.c,167 :: 		void buzzerInitialize(){
;main.c,169 :: 		Sound_Init(&LED_PORT, 7);
	MOVLW      PORTB+0
	MOVWF      FARG_Sound_Init_snd_port+0
	MOVLW      7
	MOVWF      FARG_Sound_Init_snd_pin+0
	CALL       _Sound_Init+0
;main.c,170 :: 		}
L_end_buzzerInitialize:
	RETURN
; end of _buzzerInitialize

_initRoutine:

;main.c,172 :: 		void initRoutine()
;main.c,174 :: 		configurationBitsInitialization();
	CALL       _configurationBitsInitialization+0
;main.c,176 :: 		lcdInitialization();
	CALL       _lcdInitialization+0
;main.c,178 :: 		ds1307Initialize();
	CALL       _ds1307Initialize+0
;main.c,180 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,181 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_initRoutine57:
	DECFSZ     R13+0, 1
	GOTO       L_initRoutine57
	DECFSZ     R12+0, 1
	GOTO       L_initRoutine57
	DECFSZ     R11+0, 1
	GOTO       L_initRoutine57
	NOP
	NOP
;main.c,182 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,183 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_initRoutine58:
	DECFSZ     R13+0, 1
	GOTO       L_initRoutine58
	DECFSZ     R12+0, 1
	GOTO       L_initRoutine58
	DECFSZ     R11+0, 1
	GOTO       L_initRoutine58
	NOP
	NOP
;main.c,184 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,185 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_initRoutine59:
	DECFSZ     R13+0, 1
	GOTO       L_initRoutine59
	DECFSZ     R12+0, 1
	GOTO       L_initRoutine59
	DECFSZ     R11+0, 1
	GOTO       L_initRoutine59
	NOP
	NOP
;main.c,186 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,187 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_initRoutine60:
	DECFSZ     R13+0, 1
	GOTO       L_initRoutine60
	DECFSZ     R12+0, 1
	GOTO       L_initRoutine60
	DECFSZ     R11+0, 1
	GOTO       L_initRoutine60
	NOP
	NOP
;main.c,188 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,189 :: 		}
L_end_initRoutine:
	RETURN
; end of _initRoutine

_main:

;main.c,193 :: 		void main() {
;main.c,195 :: 		initRoutine();
	CALL       _initRoutine+0
;main.c,199 :: 		UART1_Init(9600);
	MOVLW      51
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;main.c,200 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main61:
	DECFSZ     R13+0, 1
	GOTO       L_main61
	DECFSZ     R12+0, 1
	GOTO       L_main61
	DECFSZ     R11+0, 1
	GOTO       L_main61
	NOP
;main.c,204 :: 		while (1)
L_main62:
;main.c,207 :: 		clearBuffer();
	CALL       _clearBuffer+0
;main.c,208 :: 		displayTimeLCD();
	CALL       _displayTimeLCD+0
;main.c,209 :: 		receiveAlarmsData();
	CALL       _receiveAlarmsData+0
;main.c,212 :: 		if (segundos == 0) {
	MOVF       _segundos+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main64
;main.c,215 :: 		for (i=0; i<10; i++) {
	CLRF       main_i_L2+0
L_main65:
	MOVLW      10
	SUBWF      main_i_L2+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_main66
;main.c,217 :: 		if (alarmaH[i] == hora && alarmaM[i] == minutos) {
	MOVF       main_i_L2+0, 0
	ADDLW      _alarmaH+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      _hora+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main70
	MOVF       main_i_L2+0, 0
	ADDLW      _alarmaM+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORWF      _minutos+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_main70
L__main87:
;main.c,219 :: 		LED_PORT.RB0 = dispensers1[i];
	MOVF       main_i_L2+0, 0
	ADDLW      _dispensers1+0
	MOVWF      FSR
	BTFSC      INDF+0, 0
	GOTO       L__main126
	BCF        PORTB+0, 0
	GOTO       L__main127
L__main126:
	BSF        PORTB+0, 0
L__main127:
;main.c,220 :: 		LED_PORT.RB1 = dispensers2[i];
	MOVF       main_i_L2+0, 0
	ADDLW      _dispensers2+0
	MOVWF      FSR
	BTFSC      INDF+0, 0
	GOTO       L__main128
	BCF        PORTB+0, 1
	GOTO       L__main129
L__main128:
	BSF        PORTB+0, 1
L__main129:
;main.c,221 :: 		LED_PORT.RB2 = dispensers3[i];
	MOVF       main_i_L2+0, 0
	ADDLW      _dispensers3+0
	MOVWF      FSR
	BTFSC      INDF+0, 0
	GOTO       L__main130
	BCF        PORTB+0, 2
	GOTO       L__main131
L__main130:
	BSF        PORTB+0, 2
L__main131:
;main.c,222 :: 		LED_PORT.RB3 = 1;
	BSF        PORTB+0, 3
;main.c,225 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main71:
	DECFSZ     R13+0, 1
	GOTO       L_main71
	DECFSZ     R12+0, 1
	GOTO       L_main71
	DECFSZ     R11+0, 1
	GOTO       L_main71
	NOP
;main.c,234 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,235 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main72:
	DECFSZ     R13+0, 1
	GOTO       L_main72
	DECFSZ     R12+0, 1
	GOTO       L_main72
	DECFSZ     R11+0, 1
	GOTO       L_main72
	NOP
	NOP
;main.c,236 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,237 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main73:
	DECFSZ     R13+0, 1
	GOTO       L_main73
	DECFSZ     R12+0, 1
	GOTO       L_main73
	DECFSZ     R11+0, 1
	GOTO       L_main73
	NOP
	NOP
;main.c,238 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,239 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main74:
	DECFSZ     R13+0, 1
	GOTO       L_main74
	DECFSZ     R12+0, 1
	GOTO       L_main74
	DECFSZ     R11+0, 1
	GOTO       L_main74
	NOP
	NOP
;main.c,240 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,241 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main75:
	DECFSZ     R13+0, 1
	GOTO       L_main75
	DECFSZ     R12+0, 1
	GOTO       L_main75
	DECFSZ     R11+0, 1
	GOTO       L_main75
	NOP
	NOP
;main.c,242 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,243 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main76:
	DECFSZ     R13+0, 1
	GOTO       L_main76
	DECFSZ     R12+0, 1
	GOTO       L_main76
	DECFSZ     R11+0, 1
	GOTO       L_main76
	NOP
	NOP
;main.c,244 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,245 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main77:
	DECFSZ     R13+0, 1
	GOTO       L_main77
	DECFSZ     R12+0, 1
	GOTO       L_main77
	DECFSZ     R11+0, 1
	GOTO       L_main77
	NOP
	NOP
;main.c,246 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,247 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main78:
	DECFSZ     R13+0, 1
	GOTO       L_main78
	DECFSZ     R12+0, 1
	GOTO       L_main78
	DECFSZ     R11+0, 1
	GOTO       L_main78
	NOP
	NOP
;main.c,248 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,249 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main79:
	DECFSZ     R13+0, 1
	GOTO       L_main79
	DECFSZ     R12+0, 1
	GOTO       L_main79
	DECFSZ     R11+0, 1
	GOTO       L_main79
	NOP
	NOP
;main.c,250 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,251 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main80:
	DECFSZ     R13+0, 1
	GOTO       L_main80
	DECFSZ     R12+0, 1
	GOTO       L_main80
	DECFSZ     R11+0, 1
	GOTO       L_main80
	NOP
	NOP
;main.c,252 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,253 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main81:
	DECFSZ     R13+0, 1
	GOTO       L_main81
	DECFSZ     R12+0, 1
	GOTO       L_main81
	DECFSZ     R11+0, 1
	GOTO       L_main81
	NOP
	NOP
;main.c,254 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,255 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main82:
	DECFSZ     R13+0, 1
	GOTO       L_main82
	DECFSZ     R12+0, 1
	GOTO       L_main82
	DECFSZ     R11+0, 1
	GOTO       L_main82
	NOP
	NOP
;main.c,256 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,257 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main83:
	DECFSZ     R13+0, 1
	GOTO       L_main83
	DECFSZ     R12+0, 1
	GOTO       L_main83
	DECFSZ     R11+0, 1
	GOTO       L_main83
	NOP
	NOP
;main.c,258 :: 		LED_PORT = 0b10101010;
	MOVLW      170
	MOVWF      PORTB+0
;main.c,259 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main84:
	DECFSZ     R13+0, 1
	GOTO       L_main84
	DECFSZ     R12+0, 1
	GOTO       L_main84
	DECFSZ     R11+0, 1
	GOTO       L_main84
	NOP
	NOP
;main.c,260 :: 		LED_PORT = 0b01010101;
	MOVLW      85
	MOVWF      PORTB+0
;main.c,261 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main85:
	DECFSZ     R13+0, 1
	GOTO       L_main85
	DECFSZ     R12+0, 1
	GOTO       L_main85
	DECFSZ     R11+0, 1
	GOTO       L_main85
	NOP
	NOP
;main.c,262 :: 		LED_PORT = 0;
	CLRF       PORTB+0
;main.c,263 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main86:
	DECFSZ     R13+0, 1
	GOTO       L_main86
	DECFSZ     R12+0, 1
	GOTO       L_main86
	DECFSZ     R11+0, 1
	GOTO       L_main86
	NOP
	NOP
;main.c,264 :: 		}
L_main70:
;main.c,215 :: 		for (i=0; i<10; i++) {
	INCF       main_i_L2+0, 1
;main.c,265 :: 		}
	GOTO       L_main65
L_main66:
;main.c,266 :: 		}
L_main64:
;main.c,268 :: 		}
	GOTO       L_main62
;main.c,269 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
