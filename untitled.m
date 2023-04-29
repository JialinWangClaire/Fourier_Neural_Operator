%% Burgers equation and chaosu
nn = 256;
steps = 200;
dt = 1e-4;
dom = [-8 8]; 
x = chebfun('x',dom); 
tspan = linspace(0,10,steps+1);
S = spinop(dom, tspan);
S.lin = @(u) + 0.1*diff(u,2);
S.nonlin = @(u) - 0.5*diff(u.^2); % spin cannot parse "u.*diff(u)"
S.init = -sin(pi*x/8);

u = spin(S,nn,dt);

usol = zeros(nn,steps+1);
for i = 1:steps+1
    usol(:,i) = u{i}.values;
end

x = linspace(-8,8,nn+1);
x = x(1:end-1);
t = tspan;
pcolor(t,x,real(usol)); shading interp, axis tight, colormap(jet);
save('burgers_sine.mat','t','x','usol')
