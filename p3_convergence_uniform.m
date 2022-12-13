function [T, pcap,acap, mcap, dcap] = p3_convergence_uniform()
clc
close all

%% Uniform Distribution

M = 500;
N = 2000;
T = zeros(M,N);
a=2;
b=4;
e=0.05;
%% Generation of M Realisations
for i = 1: M
%uni_transform = rand(1,N);
uni_transform=a+(b-a)*rand(1,N);
T(i,1:1:N) = transformation_variable(uni_transform);
% plot(1:1:length(T),T(i,:))
% hold on;
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('|Y(n,w) - Y(w)|','fontsize',12);
% title(['Number of Realizations M = ' num2str(M)])
end

%% Convergence in Probability
pcap = zeros(1,length(T));
for n = 1:1: length(T)
c = 0;
    for m = 1 : 1 : M
        if ((T(m,n)-3) > e) 
        c = c + 1;
        elseif ((T(m,n)-3) < (-1*e))
        c = c + 1;
        end
    end 
pcap(1,n)= c/M;
end
% figure(2)
% plot(1:1:length(count1),count1)
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation p(n)','fontsize',12);
% title('Convergence in Probability for Uniform Distribution');

%% Almost Sure Convergence 
K = 0.5;
acap = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : M
        for n1 = n2 : 1 : N
            if ((T(m,n1)-3) > e) 
            c = c + 1;
            break;
            elseif ((T(m,n1)-3) < (-1*e))
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

e = (T-3).^2;
mcap = sum(e)/M;
% hold on
% plot(1:1:length(error),error,'g')
% ylim([0 1.2])
% xlim([0 N])
% xlabel('Number of Samples n ','fontsize',12);
% ylabel('Probability of Deviation','fontsize',12);
% title('Convergence for Normal Distribution');

%% Convergence in Distribution
d = -1:0.00001:1;
dcap = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : M
        if (T(m1,n))-3 <= d(t)
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