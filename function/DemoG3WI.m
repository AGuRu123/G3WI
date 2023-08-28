clear;clc;
name = 'IT_core15k';
Apara = Initialization;
load([name '.mat']);

Num=10; %Parameters of MLKNN
Smooth = 1;

ResultG3WI = [];

[rank_G3WI,time_G3WI] = G3WI(para,Apara);

k = 1;%number of selected features
f=rank_G3WI(1:k);
[Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
[Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 

ResultG3WI  = EvaluationAll(Pre_Labels,Outputs,test_target);



%     k = floor(r*D/100);
    if test == 1
        k = 2*r;%%
    else
        k = floor(r*D/100);%%
    end
    if k<2 k=2;end
    %%%%%%%正在运行G3WL~~%%%%%%%
    f=rank_G3WI(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 

    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,1);
    ResultG3WI = [ResultG3WI ;temp'];
    %%%%%%%正在运行G3WL~~%%%%%%%

    %%%%%%%MDMR运行完毕！%%%%%%%
    f = rankMDMR(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,2);
    ResultMDMR = [ResultMDMR;temp'];
    %%%%%%%MDMR运行完毕！%%%%%%%
    
    %%%%%%%正在运行LRFS~~%%%%%%%
    f = rankLRFS(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 

    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,3);
    ResultLRFS = [ResultLRFS;temp'];
    %%%%%%%LRFS运行完毕！%%%%%%%
  
    %%%%%%%正在运行SCLS~~%%%%%%%
    f = rankSCLS(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,4);
    ResultSCLS = [ResultSCLS;temp'];
    %%%%%%%SCLS运行完毕！%%%%%%%
    
    %%%%%%%正在运行PMU~~%%%%%%%%
    f = rankPMU(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,5);
    ResultPMU = [ResultPMU;temp'];
    %%%%%%PMU运行完毕！%%%%%%%
    
    %%%%%%%正在运行RWFS~~%%%%%%%
    f = rankRWFS(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,6);
    ResultRWFS = [ResultRWFS;temp'];
    %%%%%%RWFS运行完毕！%%%%%%%
      
    %%%%%%%正在运行MLSMFS~~%%%%%%%
    f = rankMLSMFS(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,7);
    ResultMLSMFS = [ResultMLSMFS;temp'];
    %%%%%%MLSMFS运行完毕！%%%%%%%
    
    %%%%%%%正在运行D2F~~%%%%%%%
    f = rankD2F(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,8);
    ResultD2F = [ResultD2F;temp'];
    %%%%%%PMU运行完毕！%%%%%%%
 
    %%%%%%正在运行MDFS~~%%%%%%%
    f = rankMDFS(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 

    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,9);
    ResultMDFS = [ResultMDFS;temp'];
    %%%%%%MDFS运行完毕！%%%%%%%
    
    %%%%%%%正在运行GRRO~~%%%%%%%
    f=rank_GRRO(1:k);
    [Prior,PriorN,Cond,CondN]=MLKNN_train(train_data(:,f),train_target,Num,Smooth);
    [Outputs,Pre_Labels]=MLKNN_test1(train_data(:,f),train_target,test_data(:,f),test_target,Num,Prior,PriorN,Cond,CondN); 
    
    temp = EvaluationAll(Pre_Labels,Outputs,test_target);
    Result = updateRe(Result,temp,r,10);
    ResultGRRO = [ResultGRRO ;temp'];
    %%%%%%%正在运行GRRO~~%%%%%%%
end

