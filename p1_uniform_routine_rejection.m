clc;
clear;
close all;

T1=100;
T2=1000;
T3=10000;
a = 2;
b = 4;
rng(42);

%For Uniform Random Variables with a=2 and b=4
figure(1) % To plot Routine Method
u1 = a + (b-a)*rand(1,T1);
subplot(2,2,1)
disp("m1 " + mean(u1))
disp("v1 " + var(u1))
disp("s1 " + std(u1))
h1=histogram(u1);
title("U~(2,4), Mean= " + mean(u1) + " Var= " + var(u1)+ " Std = " + std(u1));
xlabel("100 Samples (Routine Method)")
ylabel("Frequency")
%hold on;
grid on;
u2 = a + (b-a)*rand(1,T2);
subplot(2,2,2)
disp("mean2: " + mean(u2))
disp("var2: " + var(u2))
disp("s3 " + std(u2))
h2=histogram(u2);
grid on;
title("U~(2,4),Mean= " + mean(u2) + " Var= " + var(u2) + " Std = " + std(u2))
xlabel("1000 Samples (Routine Method)")
ylabel("Frequency")
u3 = a + (b-a)*rand(1,T3);
subplot(2,2,3)
h3=histogram(u3);
disp("m3 " +mean(u3));
disp("v3 " + var(u3))
disp("s3 " + std(u3))
grid on;
title("U~(2,4),Mean= " + mean(u3) + "Var= " + var(u3)+ " Std = " + std(u3))
xlabel("10000 Samples (Routine Method)")
ylabel("Frequency")



%Rejection Method
figure(2); % To plot Rejection Method
X1=rejection_uniform(T1);
subplot(2,2,1)
mx1 = mean(X1); vx1 = var(X1); sx1 = std(X1);
X1=histogram(X1);
grid on;
title("U~(2,4),T = 100, m = "+ mx1 + " v = " +vx1+ " std = " + sx1)
X2=rejection_uniform(T2);
mx2 = mean(X2); vx2 = var(X2); sx2 = std(X2);
subplot(2,2,2)
X2=histogram(X2);
grid on;
title("U~(2,4),T = 1000, m = "+ mx2 + " v = " +vx2+ " std = " + sx2)
X3=rejection_uniform(T3);
mx3 = mean(X3); vx3 = var(X3); sx3 = std(X3);
subplot(2,2,3)
disp("X3" + mean(X3))
X3=histogram(X3);
grid on;
title("U~(2,4),T = 10000, m = "+ mx3 + " v = " +vx3+ " std = " + sx3)


function [X] = rejection_uniform(N)
c = 0.5;
X = zeros(N,1); % Preallocate memory
for i = 1:N
    accept = false;
    while accept == false
        u = rand();
        v = unifrnd(2,4);
        if c*u <= 0.5
           X(i) = v;
           accept = true;
        end
    end
end
 
end