%모바일 기기가 mobildev 객체로 센서데이터 전송

[lat,lon,t,spd] = poslog(m);   %모바일 센서 데이터를 순서대로 변수 지정
%%%주의%%%
%Step.m 파일과 t 값이 달라질 수 있음. 함수 사용시 t 사이즈 유의할 것
%poslog로 t 변수 지정 시, t1 t2등 다른 t 사용 추천
%보고서에 이 내용 추가할 것

%변수 구간화 
%연속형 데이터를 몇 개의 Bin으로 분할하여 범주형 데이터로 변환(Binning)
nBins = 10;            %Bin 개수        
binSpacing = (max(spd) - min(spd))/nBins;  %Bin 간격(연속된 속도의 최대 최소 차에 Bin 개수로 나누어 설정)
binRanges = min(spd):binSpacing:max(spd)-binSpacing; %Bin 범위(속도 최소 값부터 최대값까지, Bin 간격 만큼)

%마지막 bin 위의 값을 enclose 위해 binRanges에 inf를 추가
binRanges(end+1) = inf;

% |histc|  각 속도 값이 어떤 빈에 속하는지 결정
[~, spdBins] = histc(spd, binRanges);



%필요 변수들 행렬 변화
lat = lat';
lon = lon';
spdBins = spdBins';

% Create a geographical shape vector, which stores the line segments as
% features.
s = geoshape();        %Geographic shape vector

for k = 1:nBins

    % Keep only the lat/lon values which match the current bin. Leave the 
    % rest as NaN, which are interpreted as breaks in the line segments.
    %예제에서 NaN을 사용하였지만, lat, lon 값의 finite 지정 문제로 ones에 lat, lon 값 대입
    latValid = lat.*ones(1, length(lat));
    latValid(spdBins==k) = lat(spdBins==k);

    lonValid = lon.*ones(1, length(lon));
    lonValid(spdBins==k) = lon(spdBins==k);    

    % To make the path continuous despite being segmented into different
    % colors, the lat/lon values that occur after transitioning from the
    % current speed bin to another speed bin will need to be kept.
    transitions = [diff(spdBins) 0];
    insertionInd = find(spdBins==k & transitions~=0) + 1;

    %추가 lat, lon 값을 삽입하기 위한 공간 사전 할당
    latSeg = zeros(1, length(latValid) + length(insertionInd));
    latSeg(insertionInd + (0:length(insertionInd)-1)) = lat(insertionInd);
    latSeg(~latSeg) = latValid;

    lonSeg = zeros(1, length(lonValid) + length(insertionInd));
    lonSeg(insertionInd + (0:length(insertionInd)-1)) = lon(insertionInd);
    lonSeg(~lonSeg) = lonValid;

    % Add the lat/lon segments to the geographic shape vector.
    s(k) = geoshape(latSeg, lonSeg);

end

wm = webmap('Open Street Map');

mwLat = 37.54614;
mwLon = 127.07387;
name = '출발지점';
iconDir = fullfile(matlabroot,'toolbox','matlab','icons');
iconFilename = fullfile(iconDir, 'matlabicon.gif');
wmmarker(mwLat, mwLon, 'FeatureName', name, 'Icon', iconFilename);

colors = autumn(nBins);
wmline(s, 'Color', colors, 'Width', 5);
wmzoom(16);