function loss = relativeL2Loss(y, t)
diffNorms = normFcn( (y - t) );
tNorms = normFcn( t );

loss = sum(diffNorms./tNorms, 1);
end

function n = normFcn(x)
n = sqrt( sum(x.^2, 2) );
end