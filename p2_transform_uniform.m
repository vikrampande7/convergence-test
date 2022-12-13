clc;
clear;
close all;

T1 = 100;
T2 = 1000;
T3 = 10000;
a = 2;
b = 4;

% For 100 samples
for i = 1:length(T1)
    gx = zeros(T1(i),1);
    n = 1;
    while n <= T1(i)
        fx = a + (b-a)*rand(1,T1);
        gx(n) = sum(fx)/T1(i);
        n = n + 1;
    end
    figure(1);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED UNIFORM RANDOM VARIABLE", T1(i))
    xlabel("100 Samples");
    ylabel("Frequency");
end

% 1000 Samples
for i = 1:length(T2)
    gx = zeros(T2(i),1);
    n = 1;
    while n <= T2(i)
        fx = a + (b-a)*rand(1,T2);
        gx(n) = sum(fx)/T2(i);
        n = n + 1;
    end
    figure(2);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED UNIFORM RANDOM VARIABLE", T2(i))
    xlabel("1000 Samples");
    ylabel("Frequency");
end

% 10000 samples
for i = 1:length(T3)
    gx = zeros(T3(i),1);
    n = 1;
    while n <= T3(i)
        fx = a + (b-a)*rand(1,T3);
        gx(n) = sum(fx)/T3(i);
        n = n + 1;
    end
    figure(3);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED UNIFROM RANDOM VARIABLE", T3(i))
    xlabel("10000 Samples");
    ylabel("Frequency");
end