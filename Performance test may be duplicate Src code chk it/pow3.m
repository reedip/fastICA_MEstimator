function [NPow3,PPow3]=pow3(N,m,s,W,A)
o=(s'-mean(s',2)*ones(1,N))';
epsilon=0.0001;
iter=1000;
Niter=0;
crit=zeros(1,N);
C=cov(o);
CC=C^(-1/2);
Z=CC*o';
W=W*real(inv(W'*W)^(1/2));%FastICA iteration
while(1-min(crit)>epsilon && Niter<iter)
Wold=W;
W=(Z*((Z'*W).^3))/N-3*W;
W=W*real(inv(W'*W)^(1/2));
crit=abs(sum(W.*Wold));
Niter=Niter+1;
end
NPow3=Niter;
if (NPow3 > 999)
    NPow3=-1;
end
     PPow3=AMARI(W,CC,A);



        