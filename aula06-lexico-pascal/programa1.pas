PROGRAM programaA;
VAR 
	nota1,nota2,nota3,media:REAL;
	idade,frequencia:INTEGER;
	status:INTEGER; 

BEGIN
	read(nota1,nota2);
	read(nota3);
	
	media := (nota1 + nota2 + nota3) / 3;
	
	if(media > 60) then
		status := 1
	else
		status := 2;
		
	read(frequencia);
	
	
	write(media,frequencia);
	
END.
