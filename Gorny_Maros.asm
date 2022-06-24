vynulovanie:
	mvi a,11111111b
	out 0b, a
	mvi D,0xAA		;hodnota, ktoru viem, ze nepouzijem
	mvi C,0XAA 

start:


riadok1:
	inn	a,1110b		;citanie stavu riadku 1
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 0?
	je nula

	cmi a,1011b		;Je to klavesa 1?
	je jedna

	cmi a,1101b		;Je to klavesa 2?
	je dva

	cmi a,1110b		;Je to klavesa 3?
	je tri
riadok2:
	inn	a,1101b		;citanie riadku 2
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 4?
	je styri

	cmi a,1011b		;Je to klavesa 5?
	je pat

	cmi a,1101b		;Je to klavesa 6?
	je sest

	cmi a,1110b		;Je to klavesa 7?
	je sedem
riadok3:
	inn	a,1011b		;citanie riadku 3
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 8?
	je osem

	cmi a,1011b		;Je to klavesa 9?
	je devat

	cmi a,1101b		;Je to klavesa A?
	je Aplus

	cmi a,1110b		;Je to klavesa B?
	je Bminus
riadok4:
	inn	a,0111b		;citanie riadku 4
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa C?
	je Cclear
;	cmi a,1011b		;Je to klavesa D?
	;nic sa nestane
;	cmi a,1101b		;Je to klavesa E?
	;nic sa nestane

	cmi a,1110b		;Je to klavesa F?
	je Foff
	jmp	start 

nula:
	mvi a,0x03
	out 10111111b, a 
	mvi D,0
	jmp start
	
jedna:
	mvi a,0x9F 
	out 10111111b, a 
	mvi D,1
	jmp start
dva:
	mvi a,0x25  
	out 10111111b, a 
	mvi D,2
	jmp start
tri:
	mvi a,0x0D
	out 10111111b, a 
	mvi D,3
	jmp start
styri:
	mvi a,0x99
	out 10111111b, a 
	mvi D,4
	jmp start
pat:
	mvi a,0x49
	out 10111111b, a 
	mvi D,5
	jmp start
sest:
	mvi a,0x41
	out 10111111b, a 
	mvi D,6
	jmp start
sedem:
	mvi A, 0x1B
	out 10111111b, a 
	mvi D, 7
	jmp start
osem:
	mvi a,0x01
	out 10111111b, a 
	mvi D,8
	jmp start
devat:
	mvi a,0x19
	out 10111111b, a 
	mvi D,9
	jmp start
Aplus:
	cmi d,0xAA
	je start
	
	mvi B,1			;Oznacim, ze som dal plus
	mvi A, 0xC7
	out 11011111b, a 
	jmp druheCislo
Bminus:
	cmi d,0xAA
	je start
	
	mvi B,2			;Oznacim, ze som dal minus
	mvi A, 0xFD
	out 11011111b, a 
	jmp druheCislo
Cclear:
	jmp vynulovanie
Foff:
	jmp exit

druheCislo:
DRriadok1:
	inn	a,1110b		;citanie stavu riadku 1
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 0?
	je nula2

	cmi a,1011b		;Je to klavesa 1?
	je jedna2

	cmi a,1101b		;Je to klavesa 2?
	je dva2

	cmi a,1110b		;Je to klavesa 3?
	je tri2
DRriadok2:
	inn	a,1101b		;citanie riadku 2
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 4?
	je styri2

	cmi a,1011b		;Je to klavesa 5?
	je pat2

	cmi a,1101b		;Je to klavesa 6?
	je sest2

	cmi a,1110b		;Je to klavesa 7?
	je sedem2
DRriadok3:
	inn	a,1011b		;citanie riadku 3
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa 8?
	je osem2

	cmi a,1011b		;Je to klavesa 9?
	je devat2

DRriadok4:
	inn	a,0111b		;citanie riadku 4
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa C?
	je Cclear

	cmi a,1011b		;Je to klavesa D?
	je Drovnasa


	cmi a,1110b		;Je to klavesa F?
	je Foff
	jmp	druheCislo 
nula2:
	mvi a,0x03
	out 11101111b, a 
	mvi C,0
	jmp druheCislo
jedna2:
	mvi a,0x9F 
	out 11101111b, a 
	mvi c,1
	jmp druheCislo
dva2:
	mvi a,0x25  
	out 11101111b, a 
	mvi c,2
	jmp druheCislo
tri2:
	mvi a,0x0D
	out 11101111b, a 
	mvi c,3
	jmp druheCislo
styri2:
	mvi a,0x99
	out 11101111b, a 
	mvi c,4
	jmp druheCislo
pat2:
	mvi a,0x49
	out 11101111b, a 
	mvi c,5
	jmp druheCislo
sest2:
	mvi a,0x41
	out 11101111b, a 
	mvi c,6
	jmp druheCislo
sedem2:
	mvi A, 0x1F
	out 11101111b, a 
	mvi C, 7
	jmp druheCislo	
osem2:
	mvi a,0x01
	out 11101111b, a 
	mvi C,8
	jmp druheCislo
devat2:
	mvi a,0x19
	out 11101111b, a 
	mvi C,9
	jmp druheCislo
Drovnasa:
	cmi C, 0xAA
	je druheCislo
	
	cmi B,1
	je pripocitaj

	cmi B,2
	je odpocitaj
	jmp druheCislo
pripocitaj:
	add d,c

	mvi A, 0xED
	out 10111111b, A


	cmi d,0
	je nulaEND

	cmi d,1
	je jednaEND

	cmi d,2
	je dvaEND

	cmi d,3
	je triEND

	cmi d,4
	je styriEND

	cmi d,5
	je patEND

	cmi d,6
	je sestEND

	cmi d,7
	je sedemEND

	cmi d,8
	je osemEND

	cmi d,9
	je devatEND

	cmi d,10
	je desatEND

	cmi d,11
	je jeden10END

	cmi d,12
	je dva10END

	cmi d,13
	je tri10END

	cmi d,14
	je styri10END

	cmi d,15
	je pat10END

	cmi d,16
	je sest10END

	cmi d,17
	je sedem10END

	cmi d,18
	je osem10END

odpocitaj:
	sub d,c

	mvi A, 0xED
	OUT 10111111b,a

	cmi d,247
	je minus9END

	cmi d,248
	je minus8END


	cmi d,249
	je minus7END


	cmi d,250
	je minus6END


	cmi d,251
	je minus5END


	cmi d,252
	je minus4END


	cmi d,253
	je minus3END


	cmi d,254
	je minus2END


	cmi d,255
	je minus1END

	cmi d,0
	je nulaEND

	cmi d,1
	je jednaEND

	cmi d,2
	je dvaEND

	cmi d,3
	je triEND

	cmi d,4
	je styriEND

	cmi d,5
	je patEND

	cmi d,6
	je sestEND

	cmi d,7
	je sedemEND

	cmi d,8
	je osemEND

	cmi d,9
	je devatEND




minus9END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x19
	out 11101111b, a 
	jmp koniec
minus8END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x01
	out 11101111b, a 
	jmp koniec
minus7END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x1B
	out 11101111b, a 
	jmp koniec
minus6END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x41
	out 11101111b, a 
	jmp koniec
minus5END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x49
	out 11101111b, a 
	jmp koniec
minus4END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x99
	out 11101111b, a 
	jmp koniec
minus3END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x0D
	out 11101111b, a 
	jmp koniec
minus2END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x25 
	out 11101111b, a 
	jmp koniec
minus1END:
	mvi A, 0xFD
	OUT 11011111b,a
	mvi a,0x9F 
	out 11101111b, a 
	jmp koniec

	
nulaEND:
	mvi A, 0xFF
	out 11011111b, A
	mvi A, 0x03 
	out 11101111b, A	
	jmp koniec
jednaEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x9F 
	out 11101111b, A	
	jmp koniec
dvaEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x25 
	out 11101111b, A	
	jmp koniec
triEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x0D
	out 11101111b, A	
	jmp koniec
styriEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x99
	out 11101111b, A	
	jmp koniec
patEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x49
	out 11101111b, A	
	jmp koniec
sestEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x41
	out 11101111b, A	
	jmp koniec
sedemEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x1B
	out 11101111b, A	
	jmp koniec
osemEND:
	mvi A,  0xFF
	out 11011111b, A
	mvi A, 0x01
	out 11101111b, A	
	jmp koniec
devatEND:
	mvi A, 0xFF
	out 11011111b, A
	mvi A, 0x19
	out 11101111b, A	
	jmp koniec
desatEND:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x03
	out 11101111b, A	
	jmp koniec
jeden10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x9F
	out 11101111b, A	
	jmp koniec
dva10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x25
	out 11101111b, A	
	jmp koniec
tri10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x0D
	out 11101111b, A	
	jmp koniec
styri10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x99
	out 11101111b, A	
	jmp koniec
pat10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x49
	out 11101111b, A	
	jmp koniec
sest10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x41
	out 11101111b, A	
	jmp koniec
sedem10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x1B
	out 11101111b, A	
	jmp koniec
osem10END:
	mvi A, 0x9F
	out 11011111b, A
	mvi A, 0x01
	out 11101111b, A	
	jmp koniec




koniec:
hornyRiadok:
	inn	a,0111b		;citanie riadku 4
	ani a,00001111b 	;Nulovanie hornych bitov
	cmi a,0111b		;Je to klavesa C?
	je Cclear


	cmi a,1101b		;Je to klavesa E?
	;nic sa nestane

	cmi a,1110b		;Je to klavesa F?
	je Foff
	jmp	hornyRiadok 
exit:
	mvi A, 0x03
	out 10111111b, A
	mvi A, 0x71
	out 11011111b, A
	mvi A, 0x71
	out 11101111b, A

