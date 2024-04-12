

%% 粒子群优化LSTM(PSO_LSTM)
clc
clear
close  all
%% 数据读取
% 设置随机种子

%读取数据
data1 =[1602.111009	11.81738226	3.416204198	12.96462712	100
1588.887621	11.86746936	3.398764812	12.93655043	97.96
1575.664233	11.96764355	3.385045119	12.90847375	95.92
1562.440846	11.91755645	3.396132543	13.03670431	93.88
1549.217458	11.82331278	3.387605733	13.02516544	91.84
1535.99407	11.98543513	3.375857163	13.01939601	89.8
1530.12785	12.14755747	3.365931347	13.01362658	87.76
1530.624832	12.30967981	3.356005531	13.00785715	85.72
1531.121815	12.47180216	3.348607972	13.06925959	83.68
1531.618797	12.6339245	3.32861539	13.09460021	81.64
1532.11578	12.64570146	3.340583814	13.07751982	79.6
1536.111821	12.6815626	3.335304934	13.128761	77.56
1526.083379	12.71459936	3.330026055	13.04335903	75.52
1516.054938	12.72003081	3.324747175	13.02078049	73.48
1506.026496	12.74237282	3.319468295	12.9927038	71.44
1495.998054	12.75328486	3.314189416	13.19783392	69.4
1490.652458	12.77184783	3.288371984	13.32640825	67.36
1489.326958	12.79775634	3.27291999	13.45498258	65.32
1488.664209	12.82366484	3.267467995	13.58355691	63.28
1487.338709	12.84957335	3.2582016	13.71213124	61.24
1476.5652	13.1306955	3.247803912	14.14284503	59.2
1466.259981	13.24280703	3.235584625	14.26072005	57.16
1457.975494	13.37254451	3.173130127	14.37859506	55.12
1449.691007	13.30228199	3.170675628	14.39929718	53.08
1433.122033	13.23201947	3.116822113	14.46514022	51.04
1424.837546	13.36175695	3.06576663	14.49647008	49
1417.728141	13.32562083	3.064723362	14.53758853	46.96
1411.793818	13.36014082	3.065459286	14.6143451	44.92
1405.859496	13.39169545	3.06619521	14.73222011	42.88
1399.925174	13.427273	3.066563172	14.75493346	40.84
1393.990851	13.455265	3.088777256	14.68248515	38.8
1388.056529	13.4785072	2.936041288	14.61003684	36.76
1379.70116	13.51563623	2.920717051	14.58809592	34.72
1350.483523	13.54478909	2.874683251	14.83883102	32.68
1347.524998	13.58987512	2.780189669	15.00530697	30.64
1359.009583	13.61008247	2.870626291	14.93150044	28.6
1300.93926	13.72525	2.877812001	15.16616085	26.56
1263.073495	13.78254	2.786399494	15.187458	24.52
1249.256065	13.97795349	2.7522	14.91787624	22.48
1234.773841	14.38921531	2.745426	14.9852	20.44
1228.616	14.64461664	2.760176645	15.06893514	18.4
1222.458159	14.54284207	2.728081801	15.04315674	16.36
1196.451	14.60108793	2.657744012	14.9814594	14.32
1224.0249	14.56472408	2.69806978	15.16616085	12.28
1158.28281	14.8603695	2.726901828	15.187458	10.24
1149.332685	15.08003895	2.598208698	15.71844811	8.2
1094.191926	15.48484031	2.618232183	16.10442211	6.16
1078.673618	15.90428056	2.4865	16.40204538	4.12
1030.387896	16.08590457	2.369012745	17.90616515	2.08
1041.855358	15.91923996	2.242028871	18.60595392	0.04];
shuru=data1(:, [1:4]);
shuchu=data1(:, [5]);
% 指定测试集行数的数组
test_indices = [29	17	33	23	4	24	31	35	49	34	22	13	2	21	3]; 
% 剔除测试集行数，得到训练集行数
train_indices = setdiff(1:size(data1, 1), test_indices);
% 划分数据集
input_train = shuru(train_indices, :);
output_train = shuchu(train_indices);
input_test = shuru(test_indices, :);
output_test = shuchu(test_indices);

input_train = input_train';
output_train = output_train';
input_test = input_test';
output_test = output_test';
%样本输入输出数据归一化
[aa,bb]=mapminmax([input_train input_test]);
[cc,dd]=mapminmax([output_train output_test]);
global inputn outputn shuru_num shuchu_num XValidation YValidation
[inputn,inputps]=mapminmax('apply',input_train,bb);
[outputn,outputps]=mapminmax('apply',output_train,dd);
shuru_num = size(input_train,1); % 输入维度
shuchu_num = 1;  % 输出维度
dam = 5; % 验证集个数，验证集是从训练集里面取的数据
idx = randperm(size(inputn,2),dam);
XValidation = inputn(:,idx);
inputn(:,idx) = [];
YValidation = outputn(idx);
outputn(idx) = [];
YValidationy = output_train(idx);
output_train(idx) = [];
%%
% 1. 寻找最佳参数
NN=5;                   %初始化群体个数
D=2;                    %初始化群体维数，
T=10;                   %初始化群体最迭代次数
c1=2;                   %学习因子1
c2=2;                   %学习因子2
%用线性递减因子粒子群算法
Wmax=1.2; %惯性权重最大值
Wmin=0.8; %惯性权重最小值
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%每个变量的取值范围
ParticleScope(1,:)=[10 200];  % 中间层神经元个数
ParticleScope(2,:)=[0.01 0.15]; % 学习率
ParticleScope=ParticleScope';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xv=rand(NN,2*D); %首先，初始化种群个体速度和位置
for d=1:D
    xv(:,d)=xv(:,d)*(ParticleScope(2,d)-ParticleScope(1,d))+ParticleScope(1,d);  
    xv(:,D+d)=(2*xv(:,D+d)-1 )*(ParticleScope(2,d)-ParticleScope(1,d))*0.2;
end
x1=xv(:,1:D);%位置
v1=xv(:,D+1:2*D);%速度
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%------初始化个体位置和适应度值-----------------
p1=x1;
pbest1=ones(NN,1);
for i=1:NN
    pbest1(i)=fitness(x1(i,:));
end
%------初始时全局最优位置和最优值---------------
gbest1=min(pbest1);
lab=find(min(pbest1)==pbest1);
g1=x1(lab,:);
gb1=ones(1,T);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-----浸入主循环，按照公式依次迭代直到迭代次数---
% N=40;                   %初始化群体个数
% D=10;                   %初始化群体维数
% T=100;                 %初始化群体最迭代次数
for i=1:T
    for j=1:NN
        if (fitness(x1(j,:))<pbest1(j))
            p1(j,:)=x1(j,:);%变量
            pbest1(j)=fitness(x1(j,:));
        end
        if(pbest1(j)<gbest1)
            g1=p1(j,:);%变量
            gbest1=pbest1(j);
        end
         w=Wmax-(Wmax-Wmin)*i/T;          
         v1(j,:)=w*v1(j,:)+c1*rand*(p1(j,:)-x1(j,:))+c2*rand*(g1-x1(j,:));
         x1(j,:)=x1(j,:)+v1(j,:); 
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%位置约束
        label=find(x1(j,:)>ParticleScope(2,:));
        x1(j,label)=ParticleScope(2,label);        
        label2=find(x1(j,:)<ParticleScope(1,:));
        x1(j,label2)=ParticleScope(1,label2);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%速度约束                
        labe3=find(v1(j,:)>ParticleScope(2,:)*0.2);
        v1(j,labe3)=ParticleScope(2,labe3)*0.2;        
        label4=find(v1(j,:)<-ParticleScope(2,:)*0.2);
        v1(j,label4)=-ParticleScope(2,label4)*0.2;              
    end
        %         gb1(i)=min(pbest1);
        gb1(i)=gbest1;
end
zhongjian1_num = round(g1(1));  
xue = g1(2);
%% 模型建立与训练
layers = [ ...
    sequenceInputLayer(shuru_num)    % 输入层
    lstmLayer(zhongjian1_num)        % LSTM层
    fullyConnectedLayer(shuchu_num)  % 全连接层
    regressionLayer];
 
options = trainingOptions('adam', ...  % 梯度下降
    'MaxEpochs',50, ...                % 最大迭代次数
    'GradientThreshold',1, ...         % 梯度阈值 
    'InitialLearnRate',xue,...
    'Verbose',0, ...
    'Plots','training-progress','ValidationData',{XValidation,YValidation});
%% 训练LSTM
net = trainNetwork(inputn,outputn,layers,options);
%% 预测
net = resetState(net);% 网络的更新状态可能对分类产生了负面影响。重置网络状态并再次预测序列。
[~,Ytrain]= predictAndUpdateState(net,inputn);
test_simu=mapminmax('reverse',Ytrain,dd);%反归一化
%测试集样本输入输出数据归一化
inputn_test=mapminmax('apply',input_test,bb);
[net,an]= predictAndUpdateState(net,inputn_test);
test_simu1=mapminmax('reverse',an,dd);%反归一化
error1=test_simu1-output_test;%测试集预测-真实
[~,Ytrain]= predictAndUpdateState(net,XValidation);
test_simuy=mapminmax('reverse',Ytrain,dd);%反归一化
%% 画图
figure
plot(output_train,'r-o','Color',[255 0 0]./255,'linewidth',0.8,'Markersize',4,'MarkerFaceColor',[255 0 0]./255)
hold on
plot(test_simu,'-s','Color',[0 0 0]./255,'linewidth',0.8,'Markersize',5,'MarkerFaceColor',[0 0 0]./255)
hold off
legend(["真实值" "预测值"])
xlabel("样本")
title("训练集")

figure
plot(YValidationy,'-o','Color',[255 255 0]./255,'linewidth',0.8,'Markersize',4,'MarkerFaceColor',[255 0 0]./255)
hold on
plot(test_simuy,'-s','Color',[0 0 0]./255,'linewidth',0.8,'Markersize',5,'MarkerFaceColor',[0 0 0]./255)
hold off
legend(["真实值" "预测值"])
xlabel("样本")
title("验证集")

figure
plot(output_test,'-o','Color',[0 0 255]./255,'linewidth',0.8,'Markersize',4,'MarkerFaceColor',[25 0 255]./255)
hold on
plot(test_simu1,'-s','Color',[0 0 0]./255,'linewidth',0.8,'Markersize',5,'MarkerFaceColor',[0 0 0]./255)
hold off
legend(["真实值" "预测值"])
xlabel("样本")
title("测试集")

 % 真实数据，行数代表特征数，列数代表样本数output_test = output_test;
T_sim_optimized = test_simu1;  % 仿真数据
L=length(T_sim_optimized)
MAE=zeros(1,L)
for i=1:L
    MAE(i)=abs(T_sim_optimized(i)-output_test(i))/output_test(i)
end

figure
plot(MAE,'-o','Color',[0 0 255]./255,'linewidth',0.8,'Markersize',4,'MarkerFaceColor',[25 0 255]./255)
legend(["误差" ])
xlabel("样本")
title("测试集")
num=size(output_test,2);%统计样本总数
error=T_sim_optimized-output_test;  %计算误差
mae=sum(abs(error))/num; %计算平均绝对误差
me=sum((error))/num; %计算平均绝对误差
mse=sum(error.*error)/num;  %计算均方误差
rmse=sqrt(mse);     %计算均方误差根
% R2=r*r;
tn_sim = T_sim_optimized';
tn_test =output_test';
N = size(tn_test,1);
R2=(N*sum(tn_sim.*tn_test)-sum(tn_sim)*sum(tn_test))^2/((N*sum((tn_sim).^2)-(sum(tn_sim))^2)*(N*sum((tn_test).^2)-(sum(tn_test))^2)); 

disp(' ')
disp('----------------------------------------------------------')

disp(['平均绝对误差mae为：            ',num2str(mae)])
disp(['平均误差me为：            ',num2str(me)])
disp(['均方误差根rmse为：             ',num2str(rmse)])
disp(['相关系数R2为：                ' ,num2str(R2)])


