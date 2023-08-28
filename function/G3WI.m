function [rank,time] = G3WI1(para,Apara)
% Gradient-based multi-label feature selection considering 3-Way Interaction
    start = tic;
    alpha = Apara.alpha;
    beta = Apara.beta;
    MaxIter = Apara.MaxIter;
    tol = Apara.tol;
    C = para.MIxy;R = para.IGxxy;D = para.IGxyy;
    for i = 1:length(R)
       R{i} = (1 - R{i} )/2; %FIC feature interaction coefficient
    end
    for i = 1:length(D)
       D{i} = (1 - D{i} )/2; %LIC label interaction coefficient
    end
    Z = zeros(size(C));[d,q] = size(Z);
    convergence = zeros(1,MaxIter);
    iter = 1;
    while iter <= MaxIter 
        for i = 1:d
            for k = 1:q
                Z(i,k) = C(i,k) - alpha*R{k}(i,:)*Z(:,k) - beta*Z(i,:)*D{i}(:,k);
                Z(i,k) = max(Z(i,k),0);
            end
        end
        convergence(iter) = loss(Z,C,R,D,Apara);
        if iter>1
            fprintf('iteration: %d loss: %.6f value: %.6f \n ',...
                iter, abs(convergence(iter) - convergence(iter-1)), convergence(iter));
            if abs(convergence(iter) - convergence(iter-1)) <= tol * abs(convergence(iter))
                    break;
            end
        end
        iter = iter + 1;
    end 
    [dumb,rank] = sort(sum(Z,2),'descend');
    time = toc(start);
end


