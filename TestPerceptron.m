function [Et,E0,E1]=TestPerceptron(W,x,y);
    [m,n] = size(x);
    X=[ones(m,1) x];
    Et=0;E0=0;E1=0;
    for q = 1:m
        xx=X(q,:);
        u=W'*xx';
        if u>=0.5
            Yh=1;
        else
            Yh=0;
        end
        if(Yh~=y(q))
            Et=Et+1;
            if(y(q)==1)
                E1=E1+1;
            else
                E0=E0+1;
            end
        end
        %Yh(q)=heaviside(u);
    end
end