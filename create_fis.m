FIS = newfis('FIS','mamdani','prod','probor','prod','sum');

FIS = addvar(FIS,'input','E',[-10 10]);
FIS = addmf(FIS,'input',1,'Negative','trimf',[-20 -10 0]);
FIS = addmf(FIS,'input',1,'Zero','trimf',[-10 0 10]);
FIS = addmf(FIS,'input',1,'Positive','trimf',[0 10 20]);

FIS = addvar(FIS,'input','CE',[-10 10]);
FIS = addmf(FIS,'input',2,'Negative','trimf',[-20 -10 0]);
FIS = addmf(FIS,'input',2,'Zero','trimf',[-10 0 10]);
FIS = addmf(FIS,'input',2,'Positive','trimf',[0 10 20]);

FIS = addvar(FIS,'output','u',[-20 20]);
FIS = addmf(FIS,'output',1,'LargeNegative','trimf',[-20 -20 -20]);
FIS = addmf(FIS,'output',1,'SmallNegative','trimf',[-10 -10 -10]);
FIS = addmf(FIS,'output',1,'Zero','trimf',[0 0 0]);
FIS = addmf(FIS,'output',1,'SmallPositive','trimf',[10 10 10]);
FIS = addmf(FIS,'output',1,'LargePositive','trimf',[20 20 20]);

FIS = addrule(FIS,[1 1 1 1 1;...   % Rule 1
            1 2 2 1 1;...   % Rule 2
            1 3 3 1 1;...   % Rule 3
            2 1 2 1 1;...   % Rule 4
            2 2 3 1 1;...   % Rule 5
            2 3 4 1 1;...   % Rule 6
            3 1 3 1 1;...   % Rule 7
            3 2 4 1 1;...   % Rule 8
            3 3 5 1 1]);
        
FIS2 = newfis('FIS2','sugeno');
FIS2 = addvar(FIS2,'input','E',[-10 10]);
FIS2 = addmf(FIS2,'input',1,'Negative','gaussmf',[7 -10]);
FIS2 = addmf(FIS2,'input',1,'Positive','gaussmf',[7 10]);

FIS2 = addvar(FIS2,'input','CE',[-10 10]);
FIS2 = addmf(FIS2,'input',2,'Negative','gaussmf',[7 -10]);
FIS2 = addmf(FIS2,'input',2,'Positive','gaussmf',[7 10]);

FIS2 = addvar(FIS2,'output','u',[-20 20]);
FIS2 = addmf(FIS2,'output',1,'Min','constant',-20);
FIS2 = addmf(FIS2,'output',1,'Zero','constant',0);
FIS2 = addmf(FIS2,'output',1,'Max','constant',20);

FIS2 = addrule(FIS2,[1 1 1 1 1;...   % Rule 1
            1 2 2 1 1;...   % Rule 2
            2 1 2 1 1;...   % Rule 3
            2 2 3 1 1]);