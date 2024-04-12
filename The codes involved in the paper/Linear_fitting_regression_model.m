% Data
data = [
   1602.111009	11.81738226	3.416204198	12.96462712	100
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
x1=data (:,1)
x2=data (:,2)
x3=data (:,3)
x4=data (:,4)
y=data(:,5)
% 使用polyfit进行一阶多项式拟合
p1 = polyfit(x1, y, 1);
% 输出拟合的直线方程的斜率和截距
slope1 = p1(1);
intercept1 = p1(2);
% 显示结果
fprintf('拟合直线方程：y1 = %.4fx + %.4f\n', slope1, intercept1);
% 将 x 值代入拟合直线计算 y 值
y_fit1 = polyval(p1, x1);
% 将小于 0 的值设置为 0
y_fit1(y_fit1 < 0) = 0;
% 将大于 100 的值设置为 100
y_fit1(y_fit1 > 100) = 100;
% 显示处理后的结果
disp(y_fit1);

% 使用polyfit进行一阶多项式拟合
p2 = polyfit(x2, y, 1);
p3 = polyfit(x3, y, 1);
p4 = polyfit(x4, y, 1);

% 计算拟合的直线方程的斜率和截距
slope2 = p2(1);
intercept2 = p2(2);
slope3 = p3(1);
intercept3 = p3(2);
slope4 = p4(1);
intercept4 = p4(2);

% 显示结果
fprintf('拟合直线方程：y2 = %.4fx + %.4f\n', slope2, intercept2);
fprintf('拟合直线方程：y3 = %.4fx + %.4f\n', slope3, intercept3);
fprintf('拟合直线方程：y4 = %.4fx + %.4f\n', slope4, intercept4);

% 将 x 值代入拟合直线计算 y 值
y_fit2 = polyval(p2, x2);
y_fit3 = polyval(p3, x3);
y_fit4 = polyval(p4, x4);

% 将小于 0 的值设置为 0
y_fit2(y_fit2 < 0) = 0;
y_fit3(y_fit3 < 0) = 0;
y_fit4(y_fit4 < 0) = 0;

% 将大于 100 的值设置为 100
y_fit2(y_fit2 > 100) = 100;
y_fit3(y_fit3 > 100) = 100;
y_fit4(y_fit4 > 100) = 100;

% 显示处理后的结果
disp(y_fit2);
disp(y_fit3);
disp(y_fit4);
y_score=y_fit1.*0.4299+y_fit2.*0.2305+ y_fit3.*0.1670+ y_fit4.*0.1726