ee=[1	3	5	8
0.333	1	2	3
0.2	0.5	1	2
0.125	0.333	0.5	1];
A=ee;
%A=input('A=');
[V,D]=eig(A);
Max_eig=max(max(D));
D==Max_eig;
[r,c]=find(D==Max_eig,1);
% 第二步：对求出的特征向量进行归一化即可得到权重
V(:,c);
disp('特征值求权重的结果为:')
disp(V(:,c)/sum(V(:,c)))
AHP_qz=V(:,c)/sum(V(:,c))
%3 计算一致性比例CR
n=4
CI=(Max_eig-n)/(n-1)
RI=[0 0 0.52 0.89 1.12 1.26 1.36 1.41 1.46 1.49 1.52 1.54 1.56 1.58 1.59]
CR=CI/RI(n)
disp('一致性指标CI=');disp(CI);
disp('一致性指标CR=');disp(CR);
if CR<0.10
disp('因为CR<0.10，所以该判断矩阵A的一致性可以接受')
else
disp('因为CR>=0.10，所以该判断矩阵A需要修改')
end 