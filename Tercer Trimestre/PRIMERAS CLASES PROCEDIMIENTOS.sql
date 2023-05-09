
DELIMITER //
create procedure incrementarValorOut (Out valor Integer)
	Begin
		
        set valor = 109;
        set valor =valor + 1;
        select valor;
    end
    
// DELIMITER ;


DELIMITER //
create procedure incrementarValorOut (InOUT valor Integer)
	Begin
        set valor = 109;
        set valor =valor + 1;
        select valor;
    end
    
// DELIMITER ;

set @valor = 109;

DELIMITER //
create procedure incrementarValorOut (In valor Integer)
	Begin
		
        set valor = 109;
        set valor =valor + 1;
        select valor;
    end
    
// DELIMITER ;


DELIMITER //
Drop procedure if exists MostrarConcellosComarca //
create procedure mostrarConcellosComarca(Out valor Integer)
	Begin
		
        set valor = 109;
        set valor =valor + 1;
        select valor;
    end
    
// DELIMITER ;


-- Forma del codigo que encontraremos por ahíalter
/*
DELIMITER //
	CREATE PROCEDURE 'nombreDelProcedimiento' ('entrada/salida' variable TipoDeDatoVariable)alter
    BEGIN
    
    END //
DELIMITER ;

	

*/