clc;
clear;
close all;

T1=100;
T2=1000;
T3=10000;

rng(42);
%For Normal Random Variables with Mean=2 and Variance=2
figure(1) % To plot Routine Method

e1 = exprnd((1/2),1,T1);
subplot(2,2,1)
h1=histogram(e1);
me1 = mean(e1); ve1 = var(e1); se1 = std(e1);
title("exp~(2)");
xlabel("100 Samples (Routine Method)")
ylabel("Frequency")
%hold on;
grid on;
e2 = exprnd((1/2),1,T2);
subplot(2,2,2)
me2 = mean(e2); ve2 = var(e2); se2 = std(e2);
h2=histogram(e2);
grid on;
title("exp~(2)")
xlabel("1000 Samples (Routine Method)")
ylabel("Frequency")
e3= exprnd((1/2),1,T3);
me3 = mean(e3); ve3 = var(e3); se3 = std(e3);
subplot(2,2,3)
h3=histogram(e3);
grid on;
title("exp~(2)")
xlabel("10000 Samples (Routine Method)")
ylabel("Frequency")



%Rejection Method
figure(2); % To plot Rejection Method
X1=rejection_exponential(T1);
mx1 = mean(X1); vx1 = var(X1); sx1 = std(X1);
disp("m1_rej" + mean(X1));
disp("v1_rej" + var(X1))
disp("s1_rej" + std(X1))
subplot(2,2,1)
X1=histogram(X1);
grid on;
title("exp~(2)")
xlabel("100 Samples (Rejection Method)")
ylabel("Frequency")
X2=rejection_exponential(T2);
mx2 = mean(X2); vx2 = var(X2); sx2 = std(X2);
disp("m3_rej" + mean(X2));
disp("v3_rej" + var(X2))
disp("s3_rej" + std(X2))
subplot(2,2,2)
X2=histogram(X2);
grid on;
title("exp~(2)")
xlabel("1000 Samples (Rejection Method)")
ylabel("Frequency")
X3=rejection_exponential(T3);
mx3 = mean(X3); vx3 = var(X3); sx3 = std(X3);
subplot(2,2,3)
X3=histogram(X3);
grid on;
title("exp~(2)");
xlabel("10000 Samples (Rejection Method)")
ylabel("Frequency")

function [X] = rejection_exponential(N)
c = 1;
X = zeros(N,1); % Preallocate memory
f=@(x)(2*exp(-2*x));
for i = 1:N
    accept = false;
    while accept == false
        u = rand();
        v = 4.*rand();
        if c*u <= f(v)
           X(i) = v;
           accept = true;
        end
    end
end
end
