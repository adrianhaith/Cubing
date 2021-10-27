function d = loadCubeData(filename)

fileID = fopen(filename,'r'); 
%[C, pos] = textscan(fileID,'%*s %*s %s %f %*s %*s %*s %*s %*s %*s %*s %f %*f %*f %*s %*s %*s %*s %*s %*s %*s %*s %*f %*f %*f %*f %*s %*f %*f %*f %f %f %f %f %f %f %*f %*f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f','Headerlines',1,'Delimiter',',');
%[C, pos] = textscan(fileID,'%*s %*s %s %f %*s %*s %*s %*s %*s %f %*f %*s %*s %*s %*s %*s %*s %*s %*s %*s %*f %*f %*f %*f %*s %*f %*f %*f %f %f %f %f %f %f %*f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %*s %*s %*s %*s %*s %f %f %f %f %f %f %f %f','Headerlines',1,'Delimiter',',');
[C, pos] = textscan(fileID,'%*s %*s %s %f %*s %*s %*s %*s %*s %f %*f %*s %*s %*s %*s %*s %*s %*s %*s %*f %*f %*f %*f %*s %*f %*f %*f %f %f %f %f %f %f %*f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f %s %*s %*s %*s %*s %f %f %f %f %f %f %f %f','Headerlines',1,'Delimiter',',');
%%                           A   B  C  D   E   F   G   H   I  J  K    L   M   N   O   P   Q   R   S   T   U   V   W   X   Y   Z  AA  AB AC AD AE AF AG AH  AI  AJ  AK  AL  AM AN AO AP AQ AR AS AT AU AV AW  AX  AY  AZ  BA BB BC BD BE BF BG BH BI BJ  BK BL BM BN BO BP BQ BR BS BT BU BV BW BX  BY  BZ  CA  CB CC CD CE CF CG CH CI CJ CK  CL  CM  CN  CO CP CQ CR CS CT CU CV CW CX CY  CZ  D
%%                           id  da dn tim sol dev dev one in in tim sol tim des ses ses scr scr rul sha sha sha ana sol pic put so  sl fa qu tu to to st  st  st  st  st  st st st
%%                                   1  2                     3                                                                      4  5  6  7  8  9      10                 11 12 13 14 15 16 17 18 19

%% NB - Need to delete certain columns: "missing turns" and "turns after solve", 
fclose(fileID);


%% variables

%total
d.DNF = strcmp(C{1},'TRUE');
d.time = C{2};
d.inspectionTime = C{3};
d.sliceTurns = C{4};
d.faceTurns = C{5};
d.quarterTurns = C{6};
d.turnsPerSecond = C{7};
d.totalRecognitionTime = C{8};
d.totalExecutionTime = C{9};

% step 0 (cross)
% load steps
ii = [10 19 28 37 46 55 64 73];
%names = {'Cross','F2L_1','F2L_2','F2L_3','F2L_4','OLL_1','OLL_2','PLL'}
for i=1:8
    d.step{i}.name = C{ii(i)}(1);
    d.step{i}.Time = C{ii(i)+1};
    d.step{i}.RecogTime = C{ii(i)+2};
    d.step{i}.ExecTime = C{ii(i)+3};
    d.step{i}.CumulativeTime = C{ii(i)+4};
    d.step{i}.SliceTurns = C{ii(i)+5};
    d.step{i}.FaceTurns = C{ii(i)+6};
    d.step{i}.QuarterTurns = C{ii(i)+7};
    d.step{i}.TurnsPerSecond = C{ii(i)+8};



end   

% determine splits
split_mat{1} = [1 0 0 0 0 0 0;
    0 1 1 1 1 0 0 ;
    0 0 0 0 0 1 0 ;
    0 0 0 0 0 0 1 ]; % 1-look OLL

split_mat{2} = [1 0 0 0 0 0 0 0 ;
    0 1 1 1 1 0 0 0 ;
    0 0 0 0 0 1 1 0 ;
    0 0 0 0 0 0 0 1 ]; % 2-look OLL

for i=1:8
    d.split_times(:,i) = d.step{i}.Time;
end

% determine method
% 1 = 1-look OLL, 2 = 2-look OLL
d.method = 2 - isnan(d.split_times(:,8));

% eliminate spurious outliers
%d.split_time(d.split_times>10000) = NaN;

d.split(:,d.method==2) = split_mat{2}*d.split_times(d.method==2,:)';
d.split(:,d.method==1) = split_mat{1}*d.split_times(d.method==1,1:7)';

d.split = d.split/1000;

d.binSize = 10;
d.split_binned = binData(d.split(1:4,:),d.binSize);
d.Nt = size(d.split_binned,2);
d.split_names = {'Cross','F2L','OLL','PLL'};
d.total_hours = nansum(d.time)/(1000*60*60);
    
