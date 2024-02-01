% 1D steady state conduction in rod
close all; clear all; clc

% input parameters
L= 5 ; %(m)
dx= 0.1 ; %(m)
N= L/dx + 1 ; % Number of nodes
tol = 1e-3 ;

% Domain Discretisation
T_new= zeros(N,0) ; %Initialising the Domain
x = linspace(0,dx,N); %x-coordinate

% Boundary Condition
for i=1:N
    T_new(1) = 50;
    T_new(N) = 75;
end

%Main Loop - Logic
error =1;iter=0 ;
while(error > tol) 
    iter=iter+1;
    T = T_new;
    for i=2:N-1
        T_new(i) = (T(i+1) + T(i-1) /2 ) ;
    end
     error = max(abs(T-T_new));
     figure(2);

     %plotting
figure(2);
    plot(x, T_new, '-o');
    xlabel('x');
    ylabel('Temperature');
    title(['Steady State 1D Heat Equation - Iteration ', num2str(iter)]);
    grid on;
    pause(0.1);
end

  