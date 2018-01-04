clear all
close all
%uncomment the plots you want to display

t_final=5;
time=0:0.001:t_final;
y_exact=0.1*exp(-time*5);
plot(time,y_exact,'b');
hold on

%backward (implicit) euler
h=0.1;
n=t_final/h+1;
y=zeros(1,n);
dy=zeros(1,n);
y(1)=0.1;
k=1;
for t=0:h:t_final-h
    dy(k)=-5*y(k);
    y(k+1)=y(k)/(1+5*h);
    k=k+1;
end
%plot(0:h:t_final,y,'sr--');
hold on

%trapezoidal
h=0.1;
n=t_final/h+1;
y=zeros(1,n);
y(1)=0.1;
k=2;
for t=0:h:t_final-h
    y(k)=y(k-1)*(1-5*h/2)/(1+5*h/2);
    k=k+1;
end
%plot(0:h:t_final,y,'ok--');
hold on

%second order RK midpoint
h=0.1;
n=t_final/h+1;
y=zeros(1,n);
y(1)=0.1;
u=y(1);
k=2;
for t=0:h:t_final-h
    k1=-5*u;
    k2=-5*(u+k1*h/2);
    u=u+k2*h;
    y(k)=u;
    k=k+1;
end
%plot(0:h:t_final,y,'*g--');
hold on

%adams-bashforth 2-step
h=5/25;
n=t_final/h+1;
y=zeros(1,n);
y(1)=0.1;
y(2)=0.1*exp(-h*5);
k=3;

for t=2*h:h:t_final
    y(k)=y(k-1)*(1-15*h/2)+5*h/2*y(k-2);
    k=k+1;
end

%plot(0:h:t_final,y,'hm--');
hold on

%adams-moulton 2-step
h=0.1;
n=t_final/h+1;
y=zeros(1,n);
y(1)=0.1;
y(2)=0.1*exp(-h*5);
k=3;

for t=2*h:h:t_final
    y(k)=1/(1+25*h/12)*(y(k-1)+h/12*(5*y(k-2)-40*y(k-1)));
    k=k+1;
end
%plot(0:h:t_final,y,'dk--')
    

    