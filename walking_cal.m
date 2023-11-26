function burned_cal = walking_cal(T,SPD,W)
% total_burned_calories = walking_cal(time,speed,body weight)
% burned_cal : 총 소모된 칼로리
% T(sec) : 측정 후 지난 시간
% SPD(km) : 측정 시각의 속도
% W(kg) : 몸무게

% script용도 주석
% clear;clc
% T = 0:1:3600;
% SPD = 4.8 * ones(1,length(T));
% W = 80;

% MET : Metabolic Equivalent of Task (MET)
MET=[];
for i = 1:length(SPD)
    spd = SPD(i);
    if spd>=7.2
        met = 6.9; 
    elseif spd>=6.6
        met = 5.8;
    elseif spd>=4.8
        met = 4.8;
    elseif spd>=3.2
        met = 3.4;
    elseif spd>=1.3
        met = 2.3;
    elseif spd>=0.5
        met = 1;
    else
        met = 0;
    end
    MET(i)=met;
end

% total burned calories(kcal) = sum{각 활동별MET*체중*소비시간(min)/60(min)}
% https://e-jnh.org/DOIx.php?id=10.4163/jnh.2021.54.2.129#__ID_SECTION_2

spantime = T(end)/(60*60); % T(sec)->T/60*60(h)
total_MET = sum(MET); % 초(sec)마다 MET를 더함
average_MET = (total_MET/i); % 평균MET(min(로 계산
burned_cal = average_MET*W*spantime;
end