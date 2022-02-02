import change.m.*
import errcorr.m.*
E=[1 1 1 1 1 1 1 0 0 0 0 0;
   1 1 1 1 1 1 1 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 1 1 1 1 0 0 0 0 0 0;
   1 1 1 1 1 1 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 0 0 0 0 0 0 0 0 0 0;
   1 1 1 1 1 1 1 0 0 0 0 0;
   1 1 1 1 1 1 1 0 0 0 0 0];
H=[0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 1 1 1 1 1 1 0 0;
   0 0 1 1 1 1 1 1 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0;
   0 0 1 1 0 0 0 0 1 1 0 0];
  
T=[0 1 1 1 1 1 1 1 1 1 1 0;
   0 1 1 1 1 1 1 1 1 1 1 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0;
   0 0 0 0 0 1 1 0 0 0 0 0];
zero=[0 0 0 1 1 1 1 1 1 0 0 0;
      0 0 1 1 1 1 1 1 1 1 0 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 1 1 1 0 0 0 0 1 1 1 0;
      0 0 1 1 1 1 1 1 1 1 0 0;
      0 0 0 1 1 1 1 1 1 0 0 0];
M=[1 1 1 0 0 0 0 0 1 1 1 0;
   1 1 1 1 0 0 0 1 1 1 1 0;
   1 1 1 1 1 0 1 1 1 1 1 0;
   1 1 0 1 1 1 1 1 0 1 1 0;
   1 1 0 0 1 1 1 0 0 1 1 0;
   1 1 0 0 0 1 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0;
   1 1 0 0 0 0 0 0 0 1 1 0];
EBP=ones(size(E));
HBP=ones(size(H));
TBP=ones(size(T));
zeroBP=ones(size(zero));
MBP=ones(size(M));
for i=1:12
   for j=1:12      
      if E(i,j)==0
         EBP(i,j)=-1;
      end
      if H(i,j)==0
         HBP(i,j)=-1;
      end
      if T(i,j)==0
         TBP(i,j)=-1;
      end
      if zero(i,j)==0
         zeroBP(i,j)=-1;
      end
      if M(i,j)==0
         MBP(i,j)=-1;
      end
   end
end 
EV = EBP(:)';
HV=HBP(:)';
MV=MBP(:)';
TV=TBP(:)';
OV=zeroBP(:)';
EHMTO=[EV;HV;MV;TV;OV]
LSAW=[EV;HV;MV;TV;OV]
EHMTOoutput=zeros(size(EHMTO))
EM=cat(2,E,H,M,T,zero)
figure(1);
subplot(6,1,1), imagesc(EM,[min(min(EM)),max(max(EM))]), 
colormap(gray), colorbar;
set(gca,'xtick',[]), set(gca,'ytick',[]);
title('Training Inputs: EHMTO with 0% Corruption')
Memory_mat=errcorr(EHMTO,EHMTO,0.001,10000,0.0000000000001)


Y_pred=Memory_mat*EHMTO

E_Pred=Y_pred(1,1:144)
E_Pred=reshape(E_Pred,[12,12])
H_Pred=Y_pred(2,1:144)
H_Pred=reshape(H_Pred,[12,12])
M_Pred=Y_pred(3,1:144)
M_Pred=reshape(M_Pred,[12,12])
T_Pred=Y_pred(4,1:144)
T_Pred=reshape(T_Pred,[12,12])
O_Pred=Y_pred(5,1:144)
O_Pred=reshape(O_Pred,[12,12])
C=cat(2,E_Pred,H_Pred,M_Pred,T_Pred,O_Pred)
figure(2);
subplot(6,1,1), imagesc(C,[min(min(C)),max(max(C))]), 
colormap(gray), colorbar;
set(gca,'xtick',[]), set(gca,'ytick',[]);
title('Training Output: EHMTO with 0% Corruption')

Dist=change(EM,12,60,1)
figure(2);
subplot(6,1,1), imagesc(Dist,[min(min(Dist)),max(max(Dist))]), 
colormap(gray), colorbar;
set(gca,'xtick',[]), set(gca,'ytick',[]);
title('Training Output: EHMTO with 0% Corruption')
