
w1 = [0.5864	,0.2184,	0.1277	,0.0675]
w2 = [0.2231,	0.2465,	0.2189	,0.3115]
AA = w1 * w1';
BB = w1 * w2';
CC = w2 * w1';
DD = w2 * w2';
d1=(AA+CC)/(AA+BB+CC+DD)
d2=(BB+DD)/(AA+BB+CC+DD)
w=w1*d1+w2*d2