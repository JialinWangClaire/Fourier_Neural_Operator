function u = fokkerplanck(init, tspan, s, a, b)

% set up the spin operator
S = spinop([0 1], tspan);
dt = tspan(2) - tspan(1);

% set up the linear and nonlinear terms of the spin operator
S.lin = @(u) - a*diff(u,1) + (b/2)*diff(u,2);
%S.nonlin = @(u) 0;

% set the initial condition
S.init = init;
plot(S.init)
% solve the equation using the spin function
u = spin(S,s,dt,'plot','off');


