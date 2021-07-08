% analyze Rubik's Cube data
% BLAM LAB RUBIKS Projects%
% Seth Berke & Adrian Haith

clc
clear all
close all

d{1} = loadCubeData('subject1.csv')
d{2} = loadCubeData('subject2.csv')
d{3} = loadCubeData('subject3.csv')

all_hours = [d{1}.total_hours d{2}.total_hours d{3}.total_hours];
total_hours_av = mean(all_hours);
total_hours_std = std(all_hours);
disp(['total solving hours = ',num2str(total_hours_av),' +/- ',num2str(total_hours_std)])


%% plot histograms of times for different steps

for subj = 1:3

    
    bins = [.1:.1:25];
    
    % get rid of outliers (>10s) - usually errors where you have to start again
    d{subj}.step_times_all(d{subj}.step_times_all>10000) = NaN;
    
    figure(10*(subj-1)+2); clf; hold on
    for i=1:4
    subplot(5,1,i); hold on
    hist(d{subj}.step_times(i,:),bins)
    
    title(d{subj}.step_names{i})
    end
    
    subplot(5,1,5)
    hist(d{subj}.time,bins)
end
%% plot time course of times for different steps
for subj=1:3
    figure(10*(subj-1)+3); clf; hold on
    % individual steps
    for step = 1:4
        subplot(1,5,step); hold on
        title(d{subj}.step_names{step})
        plot(d{subj}.step_times(step,:))
        plot([1:size(d{subj}.step_times_binned,2)]*d{subj}.binSize,d{subj}.step_times_binned(step,:),'linewidth',2)
    end

    % total time
    subplot(1,5,5); hold on
    title('total')
    plot(sum(d{subj}.step_times))
    plot([1:size(d{subj}.step_times_binned,2)]*d{subj}.binSize,sum(d{subj}.step_times_binned),'linewidth',2)
   

end

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


%% break down total solve time into different steps
fhandle = figure(1); clf; hold
set(fhandle,'Position',[200 200 1200 250]);
set(fhandle,'Color','w');


subj = 1; % which subject to plot
rng = 1:size(d{subj}.step_times_binned,2);

binSize = 10;
split_binned = binData(d{subj}.step_times_binned(1:4,rng),binSize);
Nt = size(d{subj}.step_times_binned,2);

area(binSize*[1:Nt],sum(d{subj}.step_times_binned(1:4,:),1))
area(binSize*[1:Nt],sum(d{subj}.step_times_binned(1:3,:),1))
area(binSize*[1:Nt],sum(d{subj}.step_times_binned(1:2,:),1))
area(binSize*[1:Nt],d{subj}.step_times_binned(1,:))

%%
% compare all steps for all subjects

figure(2); clf; hold on
for step = 1:4
    subplot(1,4,step); hold on
    title(d{1}.step_names{step})
    for s=1:3
        plot([10:10:8000],d{s}.step_times_binned(step,1:800))
    end
    ylim([0 30])
end



