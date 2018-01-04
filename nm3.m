close all
clear all

t_final=1;
h=0.1;
u1=0;
u2=0;
x=0:h:1;
iter=1;
y1(iter)=u1;
y2(iter)=u2;
iter=iter+1;

str2='time*exp(time)-time+2*u_2-u_1';

for t=0:h:t_final-h
    time=t;
    u_1=u1;
    u_2=u2;
    k11=u_2;
    k12=eval(str2);
    
    time=t+h/2;
    u_1=u1+h/2*k11;
    u_2=u2+h/2*k12;
    k21=u_2;
    k22=eval(str2);
    
    u_1=u1+h/2*k21;
    u_2=u2+h/2*k22;
    k31=u_2;
    k32=eval(str2); 
    
    time=t+h;
    u_1=u1+h*k31;
    u_2=u2+h*k32;
    k41=u_2;
    k42=eval(str2);   
    %fprintf('\n time: %d :\n k11:%6.6f, k21:%6.6f,k31:%6.6f, k41:%6.6f',t,k11,k21,k31,k41);
    %fprintf('\n k12:%6.6f, k22:%6.6f,k32:%6.6f, k42:%6.6f',k12,k22,k32,k42);

    u1=u1+1/6*h*(k11+2*k21+2*k31+k41);
    u2=u2+1/6*h*(k12+2*k22+2*k32+k42);
    y1(iter)=u1;
    y2(iter)=u2;
    iter=iter+1;
end

plot(x,y1,'ro--');
hold on
x=0:0.001:1;
y_exact=1/6*(exp(x).*(x.^3))-x.*exp(x)+2*exp(x)-x-2;
plot(x,y_exact,'b');
