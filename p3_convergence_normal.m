function [T, pcap,acap, mcap, dcap] = p3_convergence_normal()
%% Normal Distribution
clc
clear all
close all
M = 500;
N = 2000;
T = zeros(M,N);
e = 0.05;
%% Generation of M Realizations
for i = 1: M
%norm_transform = randn(1,N);
norm_transform = normrnd(2,sqrt(2),1,N);
T(i,1:1:N) = transformation_variable(norm_transform);
% plot(1:1:length(T),T(i,:))
% hold on;
% xlabel(['Samples n' num2str(M)]);
% ylabel('|Y(n,w) - Y(w)|->');
% title(['Number of Realizations M = ' num2str(M)])
end

%% Convergence in Probability 
pcap = zeros(1,length(T));
for n = 1:1: length(T)
c = 0;
    for m = 1 : 1 : M
        if (T(m,n) - 2 > e) 
        c = c + 1;
        elseif (T(m,n) - 2 < (-1*e))
        c = c + 1;
        end
    end 
pcap(1,n)= c/M;
end
% figure(2)
% plot(1:1:length(count1),count1)
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation p(n)','fontsize',12);
% title('Convergence in Probability for Normal Distribution');

%% Almost Sure Convergence 
K = 0.5;
acap = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : M
        for n1 = n2 : 1 : N
            if (T(m,n1) - 2 > e) 
            c = c + 1;
            break;
            elseif (T(m,n1) - 2 < (-1*e))
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

e = (T-2).^2;
mcap = sum(e)/M;
hold on
% plot(1:1:length(error),error,'g')
% ylim([0 1.2])
% xlim([0 N])
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation','fontsize',12);
% title('Convergence for Normal Distribution');

%% Convergence in Distribution
d = -1 :0.00001:1;
dcap = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : M
        if T(m1,n) -2<= d(t)
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