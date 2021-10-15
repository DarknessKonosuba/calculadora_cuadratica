-- Signo	Descripcion
--   +	    Para sumar
--   –	    Para restar
--   *	    Para multiplicacion
--   /	    Para division
--   ^	    Para exponenciacion
--   %	    Devuelve el modulo o el resto de una division
--   –	    Se usa para negacion

-- En el caso de hacer x^0.5 nos calculara la raiz cuadrada de x,
-- o si usamos x^(1/3) nos calculara la raiz cubica de x, 
-- para argumentos de tipo entero podemos decir que siempre tiene el mismo significado
-- con el resultado, este siempre tendra el mismo signo que el segundo argumento, para
-- argumentos de tipo real tiene algunos usos extra, por ejemplo
-- x%1 es la parte fraccional de x en cambio x-x%1 es la parte entera de x,
-- lo mismo con x-x%0.01 porque eliminamos los ultimos dos digitos, el signo 
-- modulo esta definido por la siguiente regla:

-- a%b == a - floor(a/b)*b
-- Donde decimos que obtener el modulo de la division de a y b es igual a menos
-- el valor entero de la division de a y b multiplicado por b, una cosa equivale a la otra.

-- CALCULADORA CUADRATICA
function calculadora(a,b,c)
    repeat
        discriminante = b*b - 4*a*c
        textoXV = "\nCorte con vertice x: "
        textoXVSimetria = "\nEje de simetria: "
        textoYV = "\nCorte con vertice y: "
        textoOrd = "\nOrdenada al Origen: "
        ordenada = c
        xv = -(b)/(2*a)
        if xv == 0 then
            xv = 0
        end
        xver = string.format(" %.2f", xv)
        if discriminante >= 0 then
            solucionUno = (-b + (discriminante^0.5)) / (2*a)
            solucionDos = (-b - (discriminante^0.5)) / (2*a)
            yv = (a*xv*xv)+(b*xv)+c
            if yv == 0 then
                yv = 0
            end
            yver = string.format(" %.2f", yv)
            resultado = "\nX1: "..string.format(" %.2f",solucionUno).."\nX2: "..string.format(" %.2f",solucionDos)..textoXV..xver..textoYV..yver..textoOrd..ordenada
        elseif discriminante == 0 then
            solucionUno = (-b + (discriminante^0.5))  / (2*a)
            yv = (a*xv*xv)+(b*xv)+c
            if yv == 0 then
                yv = 0
            end
            yver = string.format(" %.2f", yv)
            resultado = "X1: "..string.format(" %.2f",solucionUno)..textoXVSimetria..xver--..textoYV..yver..textoOrd..ordenada
        elseif discriminante < 0 then
            resultado = "\nYa que el discriminante es menor que cero entonces la ecuacion no tiene resolucion real."
        end
    until resultado
    print(resultado.."\n")
end

-- CONTROL DE INGRESO DE NUMERO
function inputInt(numero)
    repeat
        if tonumber(numero) then
        else
            print('Error debe ingresar un numero entero.')
            return valoresEcuacionCuadratica()
        end
    until tonumber(numero)
    return tonumber(numero)
end

-- FUNCION PARA QUE LA CALCULADORA FUNCIONE
function valoresEcuacionCuadratica()
    repeat
        print("Ingrese valor 'a': ")
        a = tonumber(io.read())
        inputInt(a)
        print("Ingrese valor 'b': ")
        b = tonumber(io.read())
        inputInt(b)
        print("Ingrese valor 'c': ")
        c = tonumber(io.read())
        inputInt(c)
    until tonumber(a) and tonumber(b) and tonumber(c)

    calculadora(a,b,c)
    
    print("\nOtra consulta? Si/No")
    resp = io.read()
    print("\n")
    if string.lower(resp) == "si" then
        return valoresEcuacionCuadratica()
    elseif string.lower(resp) == "no" then
        os.exit()
    end 
end

valoresEcuacionCuadratica()