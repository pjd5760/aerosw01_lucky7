function [dt_Burned_cal,Burned_cal] = running_cal(T,SPD,W)
% [dt_Burned_cal,Burned_cal] = running_cal(Time,speed,Body Wegiht)
% Burned_cal(행백터): 누적된 칼로리 소모량
% dt_Burned_cal(행벡터): 순간 칼로리 소모량
% 21013292 박재두

% Burned_cal : 총 소모된 칼로리(벡터)
% T(sec) : 측정 후 지난 시간(벡터)
% SPD(km) : 측정 시각의 속도(벡터)
% W(kg) : 몸무게(스칼라)

% script용도 주석 네이버 기준 80kg 60분 running 588kcal소모
% clear;clc
% T = 1:1:3600;
% SPD = 12 *ones(1,length(T));
% W = 80;

% MET : Metabolic Equivalent of Task (MET)
MET=[];
burned_cal = 0;

for i = 2:length(SPD)
    spd = SPD(i);
    if spd>=17.5     % 17.5km/h 달리기 MET:16.0
        met = 16.0; 
    elseif spd>=16.1 % 16.1km/h 달리기 MET:14.8
        met = 14.8;         
    elseif spd>=14.5
        met = 13.5;   
    elseif spd>=12.9 % 12.9~14.5km/h 달리기 MET:12.3
        met = 12.3;
    elseif spd>=12.1
        met = 11.5;
    elseif spd>=10.8 % 10.8~12.1km/h 달리기 MET:11.0
        met = 11.0;
    elseif spd>=9.7
        met = 10.2;
    elseif spd>=8.4  % 8.4~9.7km/h 달리기 MET:9.4
        met = 9.4;
    elseif spd>=8.0  % 8km/h 달리기 MET:8.0
        met = 8.0;
    elseif spd>=6.4  % 6.4km/h 달리기 MET:6.4
        met = 6.4;
    elseif spd>=5.6  
        met = 5.6;
    elseif spd>=4.8  % 4.8~5.6km/h 걷기 MET:4.8
        met = 4.8;
    elseif spd>=3.2  % 3.2km/h 걷기 MET:3.4
        met = 3.4;
    elseif spd>=1.3  % 집에서 걷기 MET:2.3
        met = 2.3;
    elseif spd>=0.5
        met = 1.5;   % (앉기)독서,말하기 MET:1.5
    else
        met = 1;
    end
    MET(i)=met;
    dt_burned_cal = met*W*(T(i)-T(i-1))*(1/60)*(1/60);
    dt_Burned_cal(i) = dt_burned_cal;
    burned_cal = burned_cal + dt_burned_cal;
    Burned_cal(i) = burned_cal;
end
end
% total burned calories(kcal) = sum{각 활동별MET*체중*소비시간(min)/60(min)}
% 1분당 소모한 칼로리(kcal) : 분당MET*체중*1(분)/60(분)
% dT당 소모한 칼로리(kcal) : dT당MET*체중*{(t2-t1)sec*(1min/60sec)}/60min
% https://e-jnh.org/DOIx.php?id=10.4163/jnh.2021.54.2.129#__ID_SECTION_2
