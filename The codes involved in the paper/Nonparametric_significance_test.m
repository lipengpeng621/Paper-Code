% 分成两组：一组包含特征0，另一组不包含特征0
group_with_feature_0 = [0.86 0.84	0.84	0.86 0.82	0.78	0.78 0.78];  % 特征0的准确率数据
group_without_feature_0 = [0.84 0.8	0.78	0.76 0.78	0.7	0.74];  % 不包含特征0的准确率数据

% 使用T检验检验两组的平均值是否存在显著差异
[h, p, ci, stats] = ttest2(group_with_feature_0, group_without_feature_0);

disp(['T-statistic: ', num2str(stats.tstat)]);
disp(['P-value: ', num2str(p)]);
% 使用Mann-Whitney U检验检验两组的中位数是否存在显著差异
[p, h, stats] = ranksum(group_with_feature_0, group_without_feature_0);

disp(['Mann-Whitney U statistic: ', num2str(stats.ranksum)]);
disp(['P-value: ', num2str(p)]);