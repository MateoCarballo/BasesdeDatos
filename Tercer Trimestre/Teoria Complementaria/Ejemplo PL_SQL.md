-- Crear la función
CREATE OR REPLACE FUNCTION calcular_area_circulo (radio IN NUMBER)
  RETURN NUMBER
IS
  pi CONSTANT NUMBER := 3.14159;
  area NUMBER;
BEGIN
  -- Calcular el área del círculo
  area := pi * radio * radio;
  
  -- Devolver el resultado
  RETURN area;
END;
/


-- Llamar a la función para calcular el área de un círculo con radio 5
DECLARE
  radio_circulo NUMBER := 5;
  area_circulo NUMBER;
BEGIN
  area_circulo := calcular_area_circulo(radio_circulo);
  DBMS_OUTPUT.PUT_LINE('El área del círculo con radio ' || radio_circulo || ' es: ' || area_circulo);
END;
/
