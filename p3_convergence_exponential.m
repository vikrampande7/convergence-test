function [T, pcap,acap, mcap, dcap] = p3_convergence_exponential()
clc
clear all
close all

%% Exponential Distribution
M = 500;
N = 2000;
T = zeros(M,N);

%% Generation of M Realisations
for i = 1: M
expo_transform = exprnd((1/2),1,N);
T(i,1:1:N) = transformation_variable(expo_transform);
% plot(1:1:length(T),T(i,:))
% hold on;
end

%% Convergence in Probability
pcap = zeros(1,length(T));
e = 0.05;
for n = 1:1: N
c = 0;
    for m = 1 : 1 : M
        if ((T(m,n)-0.5) > e) 
        c = c + 1;
        elseif ((T(m,n)-0.5) < (-1*e))
        c = c + 1;
        end
    end 
pcap(1,n)= c/M;
end
% figure(2)
% plot(1:1:length(count1),count1)

%% Almost Sure Convergence 
K = 0.5;
acap = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : M
        for n1 = n2 : 1 : N
            if ((T(m,n1)-0.5) > e) 
            c = c + 1;
            break;
            elseif ((T(m,n1)- 0.5) < (-1*e))
            c = c + 1;
            break;
            end
        end
    end  
acap(1,n2)= c/M;
end
hold on
% plot(1:1:length(count2),count2,'r')
% ylim([0 1.2])
% xlim([0 N])
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation','fontsize',12);
% title('Convergence for Normal Distribution');

%% Mean Square Convergence 

e = (T-0.5).^2;
mcap = sum(e)/M;
% hold on
% plot(1:1:length(error),error,'g')
% ylim([0 1.2])
% xlim([0 N])
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation','fontsize',12);
% title('Convergence for Normal Distribution');

%% Convergence in Distribution
d = 0:0.00001:2;
dcap = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : M
        if (T(m1,n)) -0.5 <= d(t)
        c1 = c1 + 1;
        end
    end
dcap(1,t) = c1/M;
end
% figure(3)
% plot(d,count3)
% ylim([0 1.2])
% xlabel(' t ','fontsize',12);
% ylabel('P(Y <= t)','fontsize',12);
% title('Cumulative Distribution Function');
end