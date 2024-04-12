clc
clear all
data = xlsread(['F:\液粘离合器试验软件和数据\模糊综合评价\最终表.xlsx'],'Sheet2');
x0 = data(:, 1:4);
m = size(x0, 1);
a1 = -1600; b1 = -1530; c1 = -1490; d1 = -1400; e1 = -1230; 
a2 = 11.8; b2 = 12.6; c2 = 12.9; d2 = 13.5; e2 = 14.5; 
a3 = -3.4; b3 = -3.34; c3 = -3.25; d3 = -3.05; e3 = -2.75; 
a4 = 12.9; b4 = 13.1; c4 = 14; d4 = 14.8; e4 =15.2; 
for i = 1:1:m
    % 1.结合时间偏移量(-)
    % disp('隶属度函数等级为5')
    if x0(i, 1) <= a1
        A15(i, 1) = 1;
    elseif x0(i, 1) > a1 & x0(i, 1) < b1
        A15(i, 1) = (b1 - x0(i, 1)) / (b1 - a1);
    else
        A15(i, 1) = 0;
    end
    % disp('隶属度函数等级为4')
    if x0(i, 1) > a1 & x0(i, 1) < b1
        A14(i, 1) = (x0(i, 1) - a1) / (b1 - a1);
    elseif x0(i, 1) >= b1 & x0(i, 1) < c1
        A14(i, 1) = (x0(i, 1)-b1) / (c1-b1);
    else
        A14(i, 1) = 0;
    end
    % disp('隶属度函数等级为3')
    if x0(i, 1) > b1 & x0(i, 1) < c1
        A13(i, 1) = (x0(i, 1) - b1) / (c1 - b1);
    elseif x0(i, 1) >= c1 & x0(i, 1) < d1
        A13(i, 1) = ( x0(i, 1)-c1) / (d1 - c1);
    else
        A13(i, 1) = 0;
    end
    % disp('隶属度函数等级为2')
    if x0(i, 1) >= c1 & x0(i, 1) < d1
        A12(i, 1) = (x0(i, 1) - c1) / (d1 - c1);
    elseif x0(i, 1) > d1 & x0(i, 1) < e1
        A12(i, 1) = (x0(i, 1)-d1) / (e1 - d1);
    else
        A12(i, 1) = 0;
    end
   % disp('隶属度函数等级为1')
    if x0(i, 1) > d1 & x0(i, 1) < e1
        A11(i, 1) = (x0(i, 1) - d1) / (e1 - d1);
    elseif x0(i, 1) >= e1
        A11(i, 1) = 1;
    else
        A11(i, 1) = 0;
    end
end
A1=[A15 A14 A13 A12 A11 ]
for i = 1:1:m
    % 1.结合时间偏移量(-)
    % disp('隶属度函数等级为5')
    if x0(i, 2) <= a2
        A25(i, 1) = 1;
    elseif x0(i, 2) > a2 & x0(i, 2) < b2
        A25(i, 1) = (b2 - x0(i, 2)) / (b2 - a2);
    else
        A25(i, 1) = 0;
    end
    % disp('隶属度函数等级为4')
    if x0(i, 2) > a2 & x0(i, 2) < b2
        A24(i, 1) = (x0(i, 2) - a2) / (b2 - a2);
    elseif x0(i, 2) >= b2 & x0(i, 2) < c2
        A24(i, 1) = (x0(i, 2) - b2) / (c2 - b2);
    else
        A24(i, 1) = 0;
    end
    % disp('隶属度函数等级为3')
    if x0(i, 2) > b2 & x0(i, 2) < c2
        A23(i, 1) = (x0(i, 2) - b2) / (c2 - b2);
    elseif x0(i, 2) >= c2 & x0(i, 2) < d2
        A23(i, 1) = (x0(i, 2) - c2) / (d2 - c2);
    else
        A23(i, 1) = 0;
    end
    % disp('隶属度函数等级为2')
    if x0(i, 2) >= c2 & x0(i, 2) < d2
        A22(i, 1) = (x0(i, 2) - c2) / (d2 - c2);
    elseif x0(i, 2) > d2 & x0(i, 2) < e2
        A22(i, 1) = (x0(i, 2) - d2) / (e2 - d2);
    else
        A22(i, 1) = 0;
    end
   % disp('隶属度函数等级为1')
    if x0(i, 2) > d2 & x0(i, 2) < e2
        A21(i, 1) = (x0(i, 2) - d2) / (e2 - d2);
    elseif x0(i, 2) >= e2
        A21(i, 1) = 1;
    else
        A21(i, 1) = 0;
    end
end
A2 = [A25 A24 A23 A22 A21];
for i = 1:1:m
    % 1.结合时间偏移量(-)
    % disp('隶属度函数等级为5')
    if x0(i, 3) <= a3
        A35(i, 1) = 1;
    elseif x0(i, 3) > a3 & x0(i, 3) < b3
        A35(i, 1) = (b3 - x0(i, 3)) / (b3 - a3);
    else
        A35(i, 1) = 0;
    end
    % disp('隶属度函数等级为4')
    if x0(i, 3) > a3 & x0(i, 3) < b3
        A34(i, 1) = (x0(i, 3) - a3) / (b3 - a3);
    elseif x0(i, 3) >= b3 & x0(i, 3) < c3
        A34(i, 1) = (x0(i, 3) - b3) / (c3 - b3);
    else
        A34(i, 1) = 0;
    end
    % disp('隶属度函数等级为3')
    if x0(i, 3) > b3 & x0(i, 3) < c3
        A33(i, 1) = (x0(i, 3) - b3) / (c3 - b3);
    elseif x0(i, 3) >= c3 & x0(i, 3) < d3
        A33(i, 1) = (x0(i, 3) - c3) / (d3 - c3);
    else
        A33(i, 1) = 0;
    end
    % disp('隶属度函数等级为2')
    if x0(i, 3) >= c3 & x0(i, 3) < d3
        A32(i, 1) = (x0(i, 3) - c3) / (d3 - c3);
    elseif x0(i, 3) > d3 & x0(i, 3) < e3
        A32(i, 1) = (x0(i, 3) - d3) / (e3 - d3);
    else
        A32(i, 1) = 0;
    end
   % disp('隶属度函数等级为1')
    if x0(i, 3) > d3 & x0(i, 3) < e3
        A31(i, 1) = (x0(i, 3) - d3) / (e3 - d3);
    elseif x0(i, 3) >= e3
        A31(i, 1) = 1;
    else
        A31(i, 1) = 0;
    end
end
A3 = [A35 A34 A33 A32 A31];
for i = 1:1:m
    % 1.结合时间偏移量(-)
    % disp('隶属度函数等级为5')
    if x0(i, 4) <= a4
        A45(i, 1) = 1;
    elseif x0(i, 4) > a4 & x0(i, 4) < b4
        A45(i, 1) = (b4 - x0(i, 4)) / (b4 - a4);
    else
        A45(i, 1) = 0;
    end
    % disp('隶属度函数等级为4')
    if x0(i, 4) > a4 & x0(i, 4) < b4
        A44(i, 1) = (x0(i, 4) - a4) / (b4 - a4);
    elseif x0(i, 4) >= b4 & x0(i, 4) < c4
        A44(i, 1) = (x0(i, 4) - b4) / (c4 - b4);
    else
        A44(i, 1) = 0;
    end
    % disp('隶属度函数等级为3')
    if x0(i, 4) > b4 & x0(i, 4) < c4
        A43(i, 1) = (x0(i, 4) - b4) / (c4 - b4);
    elseif x0(i, 4) >= c4 & x0(i, 4) < d4
        A43(i, 1) = (x0(i, 4) - c4) / (d4 - c4);
    else
        A43(i, 1) = 0;
    end
    % disp('隶属度函数等级为2')
    if x0(i, 4) >= c4 & x0(i, 4) < d4
        A42(i, 1) = (x0(i, 4) - c4) / (d4 - c4);
    elseif x0(i, 4) > d4 & x0(i, 4) < e4
        A42(i, 1) = (x0(i, 4) - d4) / (e4 - d4);
    else
        A42(i, 1) = 0;
    end
   % disp('隶属度函数等级为1')
    if x0(i, 4) > d4 & x0(i, 4) < e4
        A41(i, 1) = (x0(i, 4) - d4) / (e4 - d4);
    elseif x0(i, 4) >= e4
        A41(i, 1) = 1;
    else
        A41(i, 1) = 0;
    end
end
A4 = [A45 A44 A43 A42 A41];
A=[A1 A2 A3 A4]
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