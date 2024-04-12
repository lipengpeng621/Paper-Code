clc
clear all
data = xlsread(['F:\液粘离合器试验软件和数据\模糊综合评价\最终表.xlsx'],'Sheet2');
x0 = data(:, 1:4);
m = size(x0, 1);
k = 4;

% Define Gaussian function
gaussian = @(x, mean, sigma) exp(-((x - mean) / (sqrt(2) * sigma)).^2);

% Define mean and sigma for each level

mean_sigma1 = [
     -1553.780853	26.9971516
-1506.83728	19.28885597
-1434.375789	26.80736528
-1326.680931	59.91195125
-1142.427435	76.57093097];
mean_sigma2 = [
    12.09417635	0.287446323
12.75003943	0.063141398
13.31468356	0.089667278
13.70691139	0.287999997
15.16879446 0.623775083];
mean_sigma3 = [-3.375876981	0.026358829
-3.305128126	0.030548365
-3.127272407	0.074002703
-2.86328723	0.104817492
-2.588495656	0.171435263

    
];
mean_sigma4 = [
    13.00762606	0.057176916
13.2538037	0.25411063
14.47821548	0.194245477
14.89129514	0.212077954
16.01842048	1.284447662

];

% Initialize matrices
A1 = zeros(m, 5);
A2 = zeros(m, 5);
A3 = zeros(m, 5);
A4 = zeros(m, 5);

for i = 1:1:m
    % 1. 结合时间偏移量(-)
    for j = 1:5
        A1(i, j) = gaussian(x0(i, 1), mean_sigma1(j, 1), mean_sigma1(j, 2))^k;
    end
end

for i = 1:1:m
    % 2. 调速区间(-)
    for j = 1:5
        A2(i, j) = gaussian(x0(i, 2), mean_sigma2(j, 1), mean_sigma2(j, 2))^k;
    end
end

for i = 1:1:m
    % 3. 完全结合压力(-)
    for j = 1:5
        A3(i, j) = gaussian(x0(i, 3), mean_sigma3(j, 1), mean_sigma3(j, 2))^k;
    end
end

for i = 1:1:m
    % 4. 分离压力临界值(-)
    for j = 1:5
        A4(i, j) = gaussian(x0(i, 4), mean_sigma4(j, 1), mean_sigma4(j, 2))^k;
    end
end

A = [A1 A2 A3 A4];
A=A1.*0.4299+A2.*0.2305+ A3.*0.1670+ A4.*0.1726
% 对每一行进行归一化
A_normalized = zeros(size(A));
for i = 1:size(A, 1)
    row_sum = sum(A(i, :));
    A_normalized(i, :) = A(i, :) / row_sum;
end
score = [100, 75, 50, 25, 0]; % 权重向量，第一列*100，第二列*75，...，第五列*0

% 对归一化后的矩阵 A_normalized 中的每一列分别应用权重
A_score  = A_normalized*score';
