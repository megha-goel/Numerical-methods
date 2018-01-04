clear all
close all

x_final=pi/2;
h=pi/16;
z=[0 0 0];
finval=[0 0 0];
str2='u_2+2*u_1+cos(x)';
x=0:pi/100:pi/2;
y_exact=-1/10*(sin(x)+3*cos(x));
plot(x,y_exact,'g');
hold on
for j=1:3
    iter=1;
    u1=-0.3;
    y1(1)=u1;
    if j==1
        z(j)=0.1;
    end
    if j==2
        z(j)=-0.2;
    end
    u2=z(j);
    y2(iter)=u2;
    iter=iter+1;
    for i=0:h:x_final-h
        x=i;
        u_1=u1;
        u_2=u2;
        k11=u_2;
        k12=eval(str2);
    
        x=i+h/2;
        u_1=u1+h/2*k11;
        u_2=u2+h/2*k12;
        k21=u_2;
        k22=eval(str2);
    
        u_1=u1+h/2*k21;
        u_2=u2+h/2*k22;
        k31=u_2;
        k32=eval(str2); 
    
        x=i+h;
        u_1=u1+h*k31;
        u_2=u2+h*k32;
        k41=u_2;
        k42=eval(str2);   

        u1=u1+1/6*h*(k11+2*k21+2*k31+k41);
        u2=u2+1/6*h*(k12+2*k22+2*k32+k42);
        y1(iter)=u1;
        y2(iter)=u2;
        iter=iter+1;
    end
    finval(j)=y1(numel(y1));
if j==1
    plot(0:h:pi/2,y1,'r--');
    hold on
elseif j==2
    plot(0:h:pi/2,y1,'m--');
    hold on
else
    plot(0:h:pi/2,y1,'b-.');
    hold on
end
if j==2
    z(3)=z(1)+(z(2)-z(1))*(-0.1-finval(1))/(finval(2)-finval(1));
end
end
