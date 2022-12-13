clc;
clear;
close all;

rng(42);

syms x y;
% given joint pdf 
f=@(x,y)x+(3/2)*y.^2;

%marginal pdfs of x and y
fx=int(f,y,[0,1]);
fy=int(f,x,[0,1]);

%expectation of X and Y
Ex=int(x*fx,x,[0,1]);
Ey=int(y*fy,y,[0,1]);

%2nd moment of X and Y
Ex2=int(x^2*fx,x,[0,1]);
Ey2=int(y^2*fy,y,[0,1]);

%Variance of X and Y
varx=Ex2-(Ex^2);
varx=(varx);

vary=Ey2-(Ey^2);
vary=(vary);

% Exy 
f1=@(x,y) x.^2.*y+(3/2)*y.^3.*x;
Exy=integral2(f1,0,1,0,1);

% Cov(x,y)
covxy=round((Exy-(Ex*Ey)),6);

% Covariance Matrix 
covariance_matrix=round(([varx covxy; covxy vary]),6);

% Correlation Matrix
correlation_matrix=round([Ex2 (Exy);(Exy) Ey2],6);
%% Xs = 1000 Vector Matrix R

L= chol(covariance_matrix,'nocheck');
n=500;
R=randn(2,n); 
X=L'*R;
Xs=round(cov(X'),6); 
estimate = covariance_matrix-Xs;

% Increasing the value of n
n1=1000;
R1=randn(2,n1); 
X1=L'*R1;
Xs1=round(cov(X1'),6); 
estimate1 = covariance_matrix-Xs1;

% Increasing the value of n
n2=2000;
R2=randn(2,n2); 
X2=L'*R2;
Xs2=round(cov(X2'),6); 
estimate2 = covariance_matrix-Xs2;





