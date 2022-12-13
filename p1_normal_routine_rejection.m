clc;
clear;
close all;

T1=100;
T2=1000;
T3=10000;

rng(7);

%For Normal Random Variables with Mean=2 and Variance=2
figure(1) % To plot Routine Method

n1=normrnd(2,sqrt(2),[T1,1]);
subplot(2,2,1)
h1=histogram(n1);
title("N~(2,2), Mean= " + mean(n1) + " Var= " + var(n1) + " Std = " + std(n1));
xlabel("100 Samples (Routine Method)")
ylabel("Frequency")
%hold on;
grid on;
n2= normrnd(2,sqrt(2),[T2,1]);
subplot(2,2,2)
h2=histogram(n2);
grid on;
title("N~(2,2), Mean= " + mean(n2) + " Var= " + var(n2)+ " Std = " + std(n2))
xlabel("1000 Samples (Routine Method)")
ylabel("Frequency")
n3=normrnd(2,sqrt(2),[T3,1]);
subplot(2,2,3)
h3=histogram(n3);
grid on;
title("N~(2,2),Mean= " + mean(n3) + "Var= " + var(n3)+ " Std = " + std(n3))
xlabel("10000 Samples (Routine Method)")
ylabel("Frequency")



%Rejection Method
figure(2); % To plot Rejection Method
X1=rejection_normal(T1);
mx1 = mean(X1); vx1 = var(X1); sx1 = std(X1);
disp("m1_rej" + mean(X1));
disp("v1_rej" + var(X1))
disp("s1_rej" + std(X1))
subplot(2,2,1)
X1=histogram(X1);
grid on;
title("N~(2,2),T = 100, m = "+ mx1 + " v = " +vx1+ " std = " + sx1)
X2=rejection_normal(T2);
mx2 = mean(X2); vx2 = var(X2); sx2 = std(X2);
disp("m3_rej" + mean(X2));
disp("v3_rej" + var(X2))
disp("s3_rej" + std(X2))
subplot(2,2,2)
X2=histogram(X2);
grid on;
title("N~(2,2),T = 1000, m = "+ mx2 + " v = " +vx2+ " std = " + sx2)
X3=rejection_normal(T3);
mx3 = mean(X3); vx3 = var(X3); sx3 = std(X3);
subplot(2,2,3)
X3=histogram(X3);
grid on;
title("N~(2,2),T = 10000, m = "+ mx3 + " v = " +vx3+ " std = " + sx3);


function [X] = rejection_normal(N)
 %a = -4;
 %b = 4;
 f=@(x)exp(-((x-2).^2)/4)*(1/(sqrt(2*pi)));
 cmax = 1/(2*sqrt(2*pi))*exp(-1/4);
 %cmax = 1/(sqrt(2*2*pi));
 X = zeros(1,N);
 for i = 1:N
     accept = false;
     while accept == false
         u = rand(); %fx
         v = 2+2.*randn(); %gx
         if cmax*u <= f(v)
             X(i) = v;
             accept = true;

         end
     end
 end
end

