clear all
clc
% carrega arquivo de dados
data = importdata('parkson.mat');

bias = -1;
alpha=0.5;
iterations=1000;
acertos=zeros(100,2);
baseCorreta=zeros(100,2);
[m,n] = size(data);
for i=1:100, 
    data=data(randperm(m),:);
    k=round((8*m)/10);

    treino=data(1:k,:);
    teste=data(k+1:end,:);

    y=treino(:,1); 
    x=treino(:,2:end);

    yt=teste(:,1); 
    xt=teste(:,2:end);


    [W,et]=TrainPerecptron(x,y,iterations,alpha,bias);

    [Et,E0,E1]=TestPerceptron(W,xt,yt);
    
    baseCorreta(i,1)=sum(yt);%somando 0's w 1's teremos o numero de intancias com 1's.
    baseCorreta(i,2)=m-k-baseCorreta(i,1);%m-k é o numero de intanciar para o teste, depois é só retirar os 1's. 
    acertos(i,1)=baseCorreta(i,1)-E1;
    acertos(i,2)=baseCorreta(i,2)-E0;
end

total=(acertos(:,1)+acertos(:,2))./(baseCorreta(:,1)+baseCorreta(:,2));
AcertoMedio=mean(total);
taxMin=min(total)
taxMax=max(total)
taxMed=mean(total)
desvioP=std(total)
Classe1=mean(100*acertos(:,1)./baseCorreta(:,1))
Classe2=mean(100*acertos(:,2)./baseCorreta(:,2))




