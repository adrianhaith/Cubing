% analyze subject 2 data
% BLAM LAB RUBIKS Projects
% Seth Berke & Adrian Haith
%
% load data from Cubeast csv file into matlab data structure and make some
% basic plots
%
% Note that two columns needed to be deleted from the raw Cubeast .csv file
% (hence the appended _b in the filename. See loadCubeData.m for details

clc;clear;close all

d{1} = loadCubeData('subject1_b.csv')
d{2} = loadCubeData('subject2_b.csv')
d{3} = loadCubeData('subject3_b.csv')

all_hours = [d{1}.total_hours d{2}.total_hours d{3}.total_hours];
total_hours_av = mean(all_hours);
total_hours_std = std(all_hours);
disp(['total solving hours = ',num2str(total_hours_av),' +/- ',num2str(total_hours_std)])


%%
% make some plots
step_names = {'Cross','F2L','OLL','PLL'};
for s = 1:3
    for i=1:8
        d{s}.split_times(:,i) = d{s}.step{i}.Time;
    end
    
    % figure(10*(s-1)+1); clf; hold on
    % bar(nanmean(d{s}.split_times))
    
    bins = [.1:.1:25];
    d{s}.split_time(d{s}.split_times>10000) = NaN;
    
    figure(10*(s-1)+2); clf; hold on
    for i=1:4
    subplot(5,1,i); hold on
    hist(d{s}.split(i,:),bins)
    
    title(step_names{i})
    end
    
    
    subplot(5,1,5)
    hist(sum(d{s}.split,2),bins)
end
%%
for s=1:3
    figure(10*(s-1)+3); clf; hold on
    subplot(1,5,1); hold on
    title('Cross')
    plot(d{s}.split_times(:,1)/1000)
    plot(smooth(d{s}.split_times(:,1)/1000,50),'linewidth',2)
    
    subplot(1,5,2); hold on
    title('F2L')
    plot(sum(d{s}.split_times(:,2:5)/1000,2))
    plot(smooth(sum(d{s}.split_times(:,2:5),2)/1000,50),'linewidth',2)
    
    subplot(1,5,3); hold on
    title('OLL')
    plot(sum(d{s}.split_times(:,6)/1000,2))
    plot(smooth(sum(d{s}.split_times(:,6)/1000,2),50),'linewidth',2)
    
    subplot(1,5,4); hold on
    title('PLL')
    plot(d{s}.split_times(:,7)/1000)
    plot(smooth(d{s}.split_times(:,7)/1000,50),'linewidth',2)
    
    subplot(1,5,5); hold on
    title('total')
    plot(nansum(d{s}.split_times,2)/1000)
    plot(smooth(nansum(d{s}.split_times,2)/1000,50),'linewidth',2)
    
    %
    


end

%%
figure(4); clf; hold on
for s=1:3
    %subplot(3,1,s); hold on
    %plot(d{s}.time/1000)
    plot(smooth(d{s}.time/1000,50),'linewidth',2)
end

figure(5); clf; hold on
plot(1:length(d{1}.time),smooth(d{1}.time/1000,50),'linewidth',2)
plot(900+[1:length(d{2}.time)],smooth(d{2}.time/1000,50),'linewidth',2)
plot(10000+ [1:length(d{3}.time)],smooth(d{3}.time/1000,50),'linewidth',2)

%% recognition time versus execution time
figure(5); clf; hold on
subplot(1,3,1); hold on
plot(d{1}.step{6}.RecogTime/1000)
ylabel('Recognition Time')

subplot(1,3,2); hold on
plot(d{1}.step{6}.ExecTime/1000)
ylabel('Execution Time')

subplot(1,3,3); hold on
plot(d{1}.time/1000)


%% make nice-looking figure
fhandle = figure(1); clf; hold
set(fhandle,'Position',[200 200 1200 250]);
set(fhandle,'Color','w');

%plot(smooth(d{1}.split(1,:),20))
%plot(smooth(sum(d{1}.split(1:2,:),1),20))
%plot(smooth(sum(d{1}.split(1:3,:),1),20))
%plot(smooth(sum(d{1}.split(1:4,:),1),20))
rng = 1:size(d{3}.split,2);
%plot(d{1}.split(1,rng))
%plot(sum(d{1}.split(1:2,rng),1))
%plot(sum(d{1}.split(1:3,rng),1))
%plot(sum(d{1}.split(1:4,rng),1))

binSize = 10;
split_binned = binData(d{3}.split(1:4,rng),binSize);
Nt = size(split_binned,2);

area(binSize*[1:Nt],sum(split_binned(1:4,:),1))
area(binSize*[1:Nt],sum(split_binned(1:3,:),1))
area(binSize*[1:Nt],sum(split_binned(1:2,:),1))
area(binSize*[1:Nt],split_binned(1,:))

%%
% compare all steps for all subjects

figure(2); clf; hold on
for c = 1:4
    subplot(1,4,c); hold on
    title(d{1}.split_names{c})
    for s=1:3
        plot([10:10:8000],d{s}.split_binned(c,1:800))
    end
    ylim([0 30])
end



