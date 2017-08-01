Pdi = get_discrete_poles(Pi,Ts);

m = size(B,2);% inputs
n = size(B,1);% states
p =  size(C,1);% outputs

Adi2 =vpa([Ad zeros(n,p);
      -Cd eye(p,p)]);
Bdi2 =vpa([Bd;zeros(p,m)]);

%%Kdi2 =vpa(place(Adi2,Bdi2,Pdi));