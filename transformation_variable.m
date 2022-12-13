%% Routine to perform Tranformation
function T = transformation_variable(X)
sum1 = 0;
s = zeros(1,length(X));
T = zeros(1,length(X));
for i = 1 :1: length(X)
        s(i) = sum1 + X(i);
        sum1 = s(i);
        T(i) = s(i)/i; 
end
end