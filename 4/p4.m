%% Practica 4. Convoluci�n y correlaci�n de se�ales.
% 
% Autor. Alvarado Angeles Francisxo Javier
%
% Grupo. 2MV1
%% Objetivos.
% 
% * Conocer m�todos b�sicos de integraci�n num�rica.
% * Manipulaci�n de instrucciones en MATLAB. 
% * Simular convoluciones y correlaciones de se�ales continuas. 
% * Simular convoluciones y correlaciones de se�ales discretas. 

%% Introducci�n.
% *Formulas cerrada de Newton-Cotes* 
%
% Las  formulas  cerradas  de  Newton-Cotes nos dicen que si t� tienes una funci�n $f(x)$ que es derivable un n�mero determinado 
% de veces, y la derivada es continua, entonces en lugar de hacer la integral de $f(x)$ t� puedes aplicar la integral a la expresi�n del lado
% derecho la cual es un polinomio m�s la suma de un error la cual sera una aproximaci�n (ya que tiene un cierto error) de la integral de 
% tu funci�n original $f(x)$
%
% $$f(x)=p(x)+\frac{f^{n+1}\xi(\omega)}{(n+1)!}(x-x_0)(x-x_1)...(x-x_n)$$
% 
% 
% <<imagen 01.png>>
% 
% Estas formulas de Newton-Cotes se llaman formula cerrada de $(n+ 1)$ puntos donde n representa el grado del polinomio que se quiere usar para
% hacer la aproximaci�n, adem�s de que tambi�n representa la cantidad de puntos que se necesitan para tener el grado de dicho polinomio.
% 
% $$x_0=a$$ $$x_n=b.$$ $$h=\frac{b-a}{n}$$ $$x_i=x_0+ih;
% i=0,1,2,...,n$$
%
% Donde:
%
% $x_0:$ Inicio del intervalo.
%
% $x_n:$ Fin del intervalo.
%
% $h:$ La distancia que hay de un punto a otro(paso).
%
% $x_i:$ Representa los puntos.
%
% *Regla del Trapecio*
%
% Es nuestra primer regla de Newton-Cotes es definida de esta manera porque nos define el �rea de un trapecio, y en este caso lo que estamos 
% haciendo es encontrar un polinomio de grado uno y siguiendo nuestra analogia anterior, esto quiere decir que necesitamos 2 puntos para 
% poder tener el polinomio de grado 1.
%
% $$\int_{x_0}^{x_1}f(x) dx = \frac{h}{2}[f(x_0)+f(x_1)] - \frac{h^3}{12}f''(\xi);
% x_0<\xi<x_1$$
%
%
% 
% <<imagen 05.PNG>>
% 
% Donde:
%
% $x_0=a$
%
% $x_1=b$
%
% $h=b-a$
%
% $x_i=a+i(h);      i=0,1$
%
% En este caso la formula de aproximaci�n tiene algo que se llama el grado de precisi�n que es el grado del polinomio m�s grande, de tal manera 
% que la integral tenga error cero, es decir en este caso para nuestra regla del trapecio nuestro grado de precisi�n es 1 debido a que si usamos
% esta formula para un polinomio de grado 1 nuestro error sera cero.
% 
% Ejemplo: 
% 
% 
% 
% <<ejemplo 1.png>>
% 
%
% *Regla de Simpson (n=2).*
%
% Es nuestra segunda regla de Newton-Cotes y la ocupamos para interpolar 3 puntos y encontrar un polinomio de segundo grado, esa formula
% la llamaremos regla de Simpson, la cual es definida de la siguiente
% manera.
%
% $$\int_{x_0}^{x_2}f(x) dx =  \frac{h}{3}[f(x_0)+4f(x_1)+f(x_2)]-\frac{h^5}{90}f^{(4)}(\xi); x_{0}<\xi<x_{2}  $$
%
% 
% <<imagen 02.png>>
% 
% Donde:
%
% $x_0=a$
%
% $x_2=b$
%
% $h=\frac{b-a}{2}$
% 
% $x_i=a+ih; i=0,1,2$
% 
% Para la regla de Simpson nuestro grado de precisi�n es de 3 debido a que si usamos esta formula para un polinomio de grado 3 nuestro
% error sera cero esto se debe a que en el error tenemos definida a la derivada cuarta.
%
% Ejemplo:
% 
% 
% <<ejemplo 2.PNG>>
% 
%
% *Regla de tres octavos de Simpson. (n=3)*
%
% Es nuestra tercer regla de Newton-Cotes y la ocupamos para hacer la interpolaci�n de un polinomio de tercer grado, por lo cual
% ocuparemos 4 puntos, y esta formula esta definida de la siguiente manera:
%
% $$\int_{x_0}^{x_3}f(x) dx=\frac{3}{8}h[f(x_0)+3f(x1)+3f(x_2)+f(x_3)]-\frac{3h^{5}}{80}f^{(4)}(\xi);   x_{0}<\xi<x_{3}$$
% 
% 
% <<imagen 07.PNG>>
% 
% Para la regla de tres octavos de Simpson nuestro grado de precisi�n es de 3 debido a que si usamos esta formula para un polinomio de 
% grado 3 nuestro error sera cero esto se debe a que en el error tenemos definida a la derivada cuarta.
%
% 
% <<ejemplo 3.png>>
% 
% *Formulas cerradas de Newton-cotes compuestas*
%
% Esta secci�n es una extensi�n de las reglas de Newton-Cotes, como vimos con anterioridad la regla del trapecio sin su error la hab�amos
% definido de la siguiente manera.
% 
% $$\int_{x_0}^{x_1}f(x) dx = \frac{h}{2}[f(x_0)+f(x_1)]$$  
%
% *Regla compuesta del trapecio.*
% 
% La idea de usar la regla compuesta del trapecio es que en lugar de usar solo un trapecio para aproximar toda un �rea, subdividamos
% el �rea de nuestro intervalo en subintervalos y para cada subintervalo usar un trapecio, dicha extensi�n de la regla del trapecio se 
% define de la siguiente manera   
%
% $$\int_{a}^{b}f(x) dx = \frac{h}{2}[f(a)+2\sum_{j=1}^{n-1}f(xj)+f(b)]-\frac{b-a}{12}h^{2}f''(u); u\in(a,b)$$
%
% Donde:
%
% n= N�mero de subintervalos.
%
% h= $\frac{b-a}{n}$ (Paso)
% 
% xj= a+jh; $j=0,1,2,...,n$
%
% 
% 
% <<imagen 08.PNG>>
%
% Ejemplo:
%%
% 
% <<ejemplo 4.png>>
% 

% *Regla compuesta de simpson*
%
% La regla compuesta de  Simpson al igual que la regla compuesta del trapecio es dividir toda el �rea en subintervalos y al hacer algunas
% modificaciones a la formula de simpson queda de la siguiente manera:
%
% $$\int_{a}^{b}f(x) dx=\frac{h}{3}[f(a)+2\sum_{j=1}^{\frac{n}{2}-1}f(x_{2j})+4\sum_{j=1}^{\frac{n}{2}}f(x_{2j-1})+f(b)]-\frac{b-a}{180}h^{4}f^{4}(u)$$
%
% Donde:
%
% n=N�mero de subintervalos.(par)
% 
% h= $\frac{b-a}{n};$ (Paso)
% 
% xj=a+jh; $j=0,1,2,...,n$
%
% *Cuadratura Gaussiana*
% 
% Lo que intenta hacer la cuadratura es aproximar una integral por la evaluaci�n en determinados puntos de una funci�n multiplicada
% por determinadas constantes.
%
% $$\int_{a}^{b}f(x) dx = \sum_{i=1}^{n}c_{i}f(x_i)$$
%
% En comparaci�n con los m�todos descritos con anterioridad este m�todo en lugar de usar los polinomios de lagrange utiliza los
% polinomios de legendre, alguno de estos polinomios son:
%
% $${ 1,x,x^{2}-\frac{x^3}{3},x^{3}-\frac{3x}{5},x^{4}-\frac{6x^2}{7},...}$$  
% 
% * $p_n$-Polinomios de legendre de grado n.
% * $x_1,x_2,...,x_n$-Ra�ces de $p_n(x)$
% * $C_i=\int_{-1}^{1} \prod_{j=1}^{n}\frac{x-x_j}{x_j-x_i}dx$ entonces $\int_{-1}^{1}p(x) dx = \sum_{i=1}^nC_{i}p(x_i)$
% 
% Con anterioridad hab�amos hablado del grado de exactitud que tiene un m�todo, en este caso entre mayor sea el valor de n (l�mite
% superior de nuestra sumatoria) mayor sera nuestra precisi�n.\\Por otro lado tambi�n se pueden utilizar tablas para saber cuales son
% las raices y los $C_i$
%
% 
% 
% <<imagen 09.PNG>>
% 
%
%% Desarrollo
%% Problema 1
x= @(t) exp(-t).*(0<=t & t<=1);
y= @(t) t.*(-1<=t & t<=1);
convuno(x,y)
%%
% 
% <<imagen 1.PNG>>
% 
%% Problema 2
x= @(t) 1.*(0<=t & t<=3)-(1).*(3<t & t<=4);
y= @(t) 1.*(0<=-t & -t<=3)-(1).*(3<-t & -t<=4);
convdos(x,y)

%%
% 
% <<imagen 2.png>>
% 
%% Problema 3
n=-4:4;
a=[0 0 4 2 0 2 4 0 0];
b=[0 -9 -6 -3 0 3 6 9 0];
convdisc([n;a],[n;b])
%%
% 
% <<imagen 3.png>>
% 
%% Problema 4.
% En este inciso nos pide la correlacion de c con d pero como d es  par al
% momento de invertir 2 veces una por la operaci�n de correlacaion y otra
% por la operaci�n de la convoluci�n, entonces dicho lo anteior la
% correlaci�n de c con d nos queda igual que el inciso anterior.
n=-4:4;
a=[0 0 4 2 0 2 4 0 0];
b=[0 -9 -6 -3 0 3 6 9 0];
convdisc([n;a],[n;b])
%%
% 
% <<imagen 3.png>>
% 
%% Problema 5
conv(a,b)