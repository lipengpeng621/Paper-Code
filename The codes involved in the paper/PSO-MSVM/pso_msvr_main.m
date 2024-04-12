clear;clc;close all;
%% load Data;
data1=[1602.111009	11.81738226	3.416204198	12.96462712	100	100	100	100
1588.887621	11.86746936	3.398764812	12.93655043	97.96	97.96	97.96	97.96
1575.664233	11.96764355	3.385045119	12.90847375	95.92	95.92	95.92	95.92
1562.440846	11.91755645	3.396132543	13.03670431	93.88	93.88	93.88	93.88
1549.217458	11.82331278	3.387605733	13.02516544	91.84	91.84	91.84	91.84
1535.99407	11.98543513	3.375857163	13.01939601	89.8	89.8	89.8	89.8
1530.12785	12.14755747	3.365931347	13.01362658	87.76	87.76	87.76	87.76
1530.624832	12.30967981	3.356005531	13.00785715	85.72	85.72	85.72	85.72
1531.121815	12.47180216	3.348607972	13.06925959	83.68	83.68	83.68	83.68
1531.618797	12.6339245	3.32861539	13.09460021	81.64	81.64	81.64	81.64
1532.11578	12.64570146	3.340583814	13.07751982	79.6	79.6	79.6	79.6
1536.111821	12.6815626	3.335304934	13.128761	77.56	77.56	77.56	77.56
1526.083379	12.71459936	3.330026055	13.04335903	75.52	75.52	75.52	75.52
1516.054938	12.72003081	3.324747175	13.02078049	73.48	73.48	73.48	73.48
1506.026496	12.74237282	3.319468295	12.9927038	71.44	71.44	71.44	71.44
1495.998054	12.75328486	3.314189416	13.19783392	69.4	69.4	69.4	69.4
1490.652458	12.77184783	3.288371984	13.32640825	67.36	67.36	67.36	67.36
1489.326958	12.79775634	3.27291999	13.45498258	65.32	65.32	65.32	65.32
1488.664209	12.82366484	3.267467995	13.58355691	63.28	63.28	63.28	63.28
1487.338709	12.84957335	3.2582016	13.71213124	61.24	61.24	61.24	61.24
1476.5652	13.1306955	3.247803912	14.14284503	59.2	59.2	59.2	59.2
1466.259981	13.24280703	3.235584625	14.26072005	57.16	57.16	57.16	57.16
1457.975494	13.37254451	3.173130127	14.37859506	55.12	55.12	55.12	55.12
1449.691007	13.30228199	3.170675628	14.39929718	53.08	53.08	53.08	53.08
1433.122033	13.23201947	3.116822113	14.46514022	51.04	51.04	51.04	51.04
1424.837546	13.36175695	3.06576663	14.49647008	49	49	49	49
1417.728141	13.32562083	3.064723362	14.53758853	46.96	46.96	46.96	46.96
1411.793818	13.36014082	3.065459286	14.6143451	44.92	44.92	44.92	44.92
1405.859496	13.39169545	3.06619521	14.73222011	42.88	42.88	42.88	42.88
1399.925174	13.427273	3.066563172	14.75493346	40.84	40.84	40.84	40.84
1393.990851	13.455265	3.088777256	14.68248515	38.8	38.8	38.8	38.8
1388.056529	13.4785072	2.936041288	14.61003684	36.76	36.76	36.76	36.76
1379.70116	13.51563623	2.920717051	14.58809592	34.72	34.72	34.72	34.72
1350.483523	13.54478909	2.874683251	14.83883102	32.68	32.68	32.68	32.68
1347.524998	13.58987512	2.780189669	15.00530697	30.64	30.64	30.64	30.64
1359.009583	13.61008247	2.870626291	14.93150044	28.6	28.6	28.6	28.6
1300.93926	13.72525	2.877812001	15.16616085	26.56	26.56	26.56	26.56
1263.073495	13.78254	2.786399494	15.187458	24.52	24.52	24.52	24.52
1249.256065	13.97795349	2.7522	14.91787624	22.48	22.48	22.48	22.48
1234.773841	14.38921531	2.745426	14.9852	20.44	20.44	20.44	20.44
1228.616	14.64461664	2.760176645	15.06893514	18.4	18.4	18.4	18.4
1222.458159	14.54284207	2.728081801	15.04315674	16.36	16.36	16.36	16.36
1196.451	14.60108793	2.657744012	14.9814594	14.32	14.32	14.32	14.32
1224.0249	14.56472408	2.69806978	15.16616085	12.28	12.28	12.28	12.28
1158.28281	14.8603695	2.726901828	15.187458	10.24	10.24	10.24	10.24
1149.332685	15.08003895	2.598208698	15.71844811	8.2	8.2	8.2	8.2
1094.191926	15.48484031	2.618232183	16.10442211	6.16	6.16	6.16	6.16
1078.673618	15.90428056	2.4865	16.40204538	4.12	4.12	4.12	4.12
1030.387896	16.08590457	2.369012745	17.90616515	2.08	2.08	2.08	2.08
1041.855358	15.91923996	2.242028871	18.60595392	0.04	0.04	0.04	0.04];
X=data1(:,1:4)
Y=data1(:,5:8)

% 归一化
[inputn,inputps]=mapminmax(X',0,1);
X=inputn';
[outputn,outputps]=mapminmax(Y',0,1);
Y=outputn';
% 给定索引号
index = [29, 17, 33, 23, 4, 24, 31, 35, 49, 34, 22, 13, 2, 21, 3];

% 根据索引号提取测试集数据
Xtest = X(index, :);
Ytest = Y(index, :);
% 剔除测试集行数，得到训练集行数
Xtrain_index= setdiff(1:size(X, 1), index);
Xtrain=X(Xtrain_index, :);
Ytrain = Y(Xtrain_index, :); 
% %% 划分数据集
% rand('state',0)
% r=randperm(size(X,1));
% ntrain =size(X,1)*0.7 ;          % 50%的为训练集 剩下为测试集
% Xtrain = X(r(1:ntrain),:);       % 训练集输入
% Ytrain = Y(r(1:ntrain),:);       % 训练集输出
% Xtest  = X(r(ntrain+1:end),:);   % 测试集输入
% Ytest  = Y(r(ntrain+1:end),:);   % 测试集输出

%% 没优化的24输出msvm
% 随机产生惩罚参数与核参数
C    = 10*rand;%惩罚参数
par  = 10*rand;%核参数
ker  = 'rbf';
tol  = 1e-50;
epsi = 1;
% 训练
[Beta,NSV,Ktrain,i1] = msvr(Xtrain,Ytrain,ker,C,epsi,par,tol);
% 测试
Ktest = kernelmatrix(ker,Xtest',Xtrain',par);
Ypredtest = Ktest*Beta;

% 计算均方误差
mse_test=sum(sum((Ypredtest-Ytest).^2))/(size(Ytest,1)*size(Ytest,2))

% 反归一化
yuce=mapminmax('reverse',Ypredtest',outputps);yuce=yuce';
zhenshi=mapminmax('reverse',Ytest',outputps);zhenshi=zhenshi';
%% 粒子群优化多输出支持向量机
[y ,trace]=psoformsvm(Xtrain,Ytrain,Xtest,Ytest);
%% 利用得到最优惩罚参数与核参数重新训练一次支持向量机
C    = y(1);%惩罚参数
par  = y(2);%核参数
[Beta,NSV,Ktrain,i1] = msvr(Xtrain,Ytrain,ker,C,epsi,par,tol);
Ktest = kernelmatrix(ker,Xtest',Xtrain',par);
Ypredtest_pso = Ktest*Beta;
% 误差
pso_mse_test=sum(sum((Ypredtest_pso-Ytest).^2))/(size(Ytest,1)*size(Ytest,2))
% 反归一化
yuce_pso=mapminmax('reverse',Ypredtest_pso',outputps);yuce_pso=yuce_pso';
%预测结果
yuce_socre=yuce_pso(:,1)