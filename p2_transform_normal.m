clc;
clear;
close all;

T1 = 100;
T2 = 1000;
T3 = 10000;
lambda = 2;

% For 100 samples
for i = 1:length(T1)
    gx = zeros(T1(i),1);
    n = 1;
    while n <= T1(i)
        fx = normrnd(2,2,[T1,1]);
        gx(n) = sum(fx)/T1(i);
        n = n + 1;
    end
    figure(1);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED NORMAL RANDOM VARIABLE", T1(i))
    xlabel("100 Samples");
    ylabel("Frequency");
end

% 1000 Samples
for i = 1:length(T2)
    gx = zeros(T2(i),1);
    n = 1;
    while n <= T2(i)
        fx = normrnd(2,2,[T2,1]);
        gx(n) = sum(fx)/T2(i);
        n = n + 1;
    end
    figure(2);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED NORMAL RANDOM VARIABLE", T2(i))
    xlabel("1000 Samples");
    ylabel("Frequency");
end

% 10000 samples
for i = 1:length(T3)
    gx = zeros(T3(i),1);
    n = 1;
    while n <= T3(i)
        fx = normrnd(2,2,[T3,1]);
        gx(n) = sum(fx)/T3(i);
        n = n + 1;
    end
    figure(3);
    subplot(1,1,i)
    histogram(gx)
    title("TRANSFORMED NORMAL RANDOM VARIABLE", T3(i))
    xlabel("10000 Samples");
    ylabel("Frequency");
end