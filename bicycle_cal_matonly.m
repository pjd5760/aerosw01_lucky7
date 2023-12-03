function [dt_Burned_cal,Burned_cal] = bicycle_cal_matonly(T,SPD,W)
% [dt_Burned_cal,Burned_cal] = bicycle_cal_matonly(Time,speed,Body Wegiht)
% Burned_cal(행백터): 누적된 칼로리 소모량
% dt_Burned_cal(행벡터): 순간 칼로리 소모량
% 21013292 박재두
% matlab전용

% Burned_cal : 총 소모된 칼로리(벡터)
% T(sec) : 측정 후 지난 시간(벡터)
% SPD(km) : 측정 시각의 속도(벡터)
% W(kg) : 몸무게(스칼라)

% script용도 주석 네이버 기준 80kg 60분 running 588kcal소모
% clear;clc
% T = 1:1:3600;
% SPD = 12 *ones(1,length(T));
% W = 80;

% MET 벡터 SPD크기와 같음
% MET : Metabolic Equivalent of Task (MET)
MET=[];
burned_cal = 0;
for i = 2:length(SPD)
    spd = SPD(i);
    if spd>=30
        met = 9; 
    elseif spd>=20
        met = 8;         
    elseif spd>=16
        met = 5;   
    elseif spd>=12
        met = 4;
    elseif spd>=8
        met = 3;
    elseif spd>=4
        met = 2.5;
    elseif spd>=2
        met = 2;
    else
        met = 1.0;
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