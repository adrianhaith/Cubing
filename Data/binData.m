function [binnedData binSTD binSE] = binData(data,binSize)
% bins data into bins of given size, then averages
%
% Input:    data    - Nsubj x Ntrials matrix
%           binSize - Number of trials per bin
%
% Output:   binnedData - Nsubj x (Ntrials/binSize)
%           binSTD     - Nsubj x (Ntrials/binSize)
%
% NB - Nsubj must be an integer multiple of binSize
[Nsubj Ntrials] = size(data);
rr = rem(Ntrials,binSize);

if(rr~=0)
    warning('Length of data vector not an integer multiple of bin size. Cropping end of data')
    data = data(:,1:end-rr);
    Ntrials = Ntrials-rr;
end


for k=1:Nsubj
    binnedData(k,:) = nanmean(reshape(data(k,:),binSize,Ntrials/binSize));
    binSTD(k,:) = nanstd(reshape(data(k,:),binSize,Ntrials/binSize));
    binSE(k,:) = seNaN(reshape(data(k,:),binSize,Ntrials/binSize));
end
