% number of realizations to generate
N = 2;

% parameters for the Gaussian random field
gamma = 2.5;
tau = 7;
sigma = 7^(2);

% parameters for the drift and diffusion coefficients
a = 0.005;
b = 0.002;

% grid size
s = 8192;
steps = 200;

input = zeros(N, s);

output = zeros(N, s);


% initial distribution
tspan = linspace(0,1,steps+1);
x = linspace(0,1,s+1);

for j = 1:N
    % initialize the density
    u0 = GRF1(s/2, 0, gamma, tau, sigma, "periodic"); 
    % disp(min(u0))
    u0 = u0 + abs(min(u0));
    u = fokkerplanck(u0, tspan, s, a, b);
    u0eval = u0(x);
    input(j,:) = u0eval(1:end-1);
    
   
    output(j,:) = u{(steps+1)}.values;
      
    disp(j);
end
