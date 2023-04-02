%% Helper functions

function [loss, grad] = modelLoss(x, t, net)
y = net.forward(x);
y = permute(stripdims(y), [3 1 2]);
y = stripdims(y);

loss = relativeL2Loss(y, t);

grad = dlgradient(loss, net.Learnables);
end

