%�鿴��ά����Ч��
load fisheriris
data = normalization(meas); 
[idx, C, ~] = Kmeans(data(:, 1:2), 3, 0, Inf);
figure('name', '��ά����Ч��')
gscatter(data(:, 1), data(:, 2), idx, 'rgb')
hold on
plot(C(:, 1), C(:, 2), 'kx')
legend('Cluster 1',...
       'Cluster 2',...
       'Cluster 3',...
       'ClusterCentroid')