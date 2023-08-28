function [l] = loss(Z,C,R,D,Apara)
    FL_loss = norm(Z-C,'fro')^2;
    FFL_loss = 0;
    [d,q] = size(Z);
    for i = 1:d
        for j = 1:d
            for k = 1:q
                 FFL_loss = FFL_loss + Z(i,k)*Z(j,k)*R{k}(i,j);
            end
        end
    end
    FLL_loss = 0;
    for i = 1:d
        for k = 1:q
            for l = 1:q
                 FLL_loss = FLL_loss + Z(i,k)*Z(i,l)*D{i}(k,l);
            end
        end
    end
    l = FL_loss + Apara.alpha*FFL_loss + Apara.beta*FLL_loss;
end