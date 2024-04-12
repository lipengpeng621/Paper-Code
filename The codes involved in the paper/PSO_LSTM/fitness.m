function result = fitness(pop)

global inputn outputn shuru_num shuchu_num XValidation YValidation
tic

pop(1)=round(pop(1));
layers = [ ...
    sequenceInputLayer(shuru_num)
    lstmLayer(pop(1))
    fullyConnectedLayer(shuchu_num)
    regressionLayer];
options = trainingOptions('adam', ...  % �ݶ��½�
    'MaxEpochs',50, ...                % ����������
     'GradientThreshold',1, ...         % �ݶ���ֵ 
    'InitialLearnRate',pop(2));



% ѵ��LSTM
net = trainNetwork(inputn,outputn,layers,options);
% Ԥ��
net = resetState(net);% ����ĸ���״̬���ܶԷ�������˸���Ӱ�졣��������״̬���ٴ�Ԥ�����С�


[~,Ytrain]= predictAndUpdateState(net,XValidation);
cg = mse(Ytrain,YValidation);
 toc
disp('-------------------------')
result = cg;


end