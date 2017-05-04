function sum = sumM(X)
size=size(X);
sum=0;
for(i=1:size(1))
for(j=1:size(2))
sum=sum+X(i,j);
end
end
end
