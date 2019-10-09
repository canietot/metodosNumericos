clc
x = [0 6 10 13 17 20 28];
y = [6.67 17.33 42.67 37.33 30.10 29.31 28.74];

ps= [0:0.001:28]; % Puntos donde evaluar.
%p = 8;   % El polinomio se evalua en p (valor a hallar)

function suma = lagrange(x, fx, p)
    % Calcule P(p)
    n = length(x) - 1;
    suma = 0;
    for k=1:1:n+1
        ter_sig = (L(k, n, p, x))*fx(k);
        suma = suma + ter_sig;
    end
end

function multiplicacion = L(k, n, p, x)
    multiplicacion = 1;
    for i=1:1:n+1
        if (i != k)
            ter_sig = (p - x(i)) / (x(k) - x(i));
            multiplicacion = multiplicacion * ter_sig;
        end
    end
end

z = 0;
xr = 0;
result = [];
for i=1:1:length(ps)
  zaux = lagrange(x, y, ps(i));
  result (i) = zaux;
  if (zaux > z)
    z = zaux;
    xr = ps(i);
  endif
end

plot( ps, result ); xlabel( '\Dia' ); ylabel( 'Muestra (mg)' ); title( "Resultado Practica 1" ); grid

z
xr