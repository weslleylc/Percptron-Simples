function [W,Et]=TrainPerecptron(x,y,iterations,alpha,bias);
    [m,n] = size(x);
    X=[ones(m,1) x];
    W = zeros(n+1,1);
    W(1)=bias;
    for i = 1:iterations  
        Et=0;
        for q = 1:m
            u=W'*X(q,:)';
            if u>=0.5
                yi=1;
            else
                yi=0;
            end
            if(yi~=y(q))
                e=y(q)-yi;         
                W=W+alpha*e*X(q,:)';         
                W(1)=W(1)+alpha*e;
                Et=Et+1;
            end    
        end    
    end  
end