function X = scale(X)
length=size(X)(2);

for(i=1:length)
u=meanM(X(:,i));
range=max(X(:,i))-min(X(:,i));
if(range~=0)
X(:,i)=(X(:,i)-u)/range;
end
end
