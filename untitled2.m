x = 1:8192;
mat1 = xn(:,1)/sum(xn(:,1));
mat2= extractdata(yn)/sum(extractdata(yn));
mat3=t(idxToPlot(4),:)/sum(t(idxToPlot(4),:));

plot(x,mat1,'b',x,mat2,'r',x,mat3,'g')