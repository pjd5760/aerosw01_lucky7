function [time,dt_Burned_cal,Burned_cal] = sim_interp_bicycle_cal(T,SPD,W)
% [time,dt_Burned_cal,Burned_cal] = interp_bicycle_cal_matonly(Time,speed,Body Wegiht)
% time(sec) : (행백터)
% Burned_cal(kcal): 누적된 칼로리 소모량(행백터)
% dt_Burned_cal(kcal): 순간 칼로리 소모량(행벡터)
% 21013292 박재두

% T(sec) : 측정 후 지난 시간(열벡터)
% SPD(km) : 측정 시각의 속도(열벡터)
% W(kg) : 몸무게(스칼라)


% script용도 주석 네이버 기준 80kg 60분 running 588kcal소모
% clear;clc
% T = 1:1:3600;
% SPD = 12 *rand(1,length(T));
% W = 80;

% 보간법 사용
new_t = 1:1:T(end); % new_t(행벡터)
time = new_t; % time(행벡터)
new_speed = interp1(T, SPD, new_t); % new_speed(행벡터)

%%
% 시뮬링크 source로 사용하기 위한 2행 n열 행렬화
% SPD = [time;new_speed];

open_system('BICYCLE');
% 모델의 StopTime을 무한대로 설정
set_param('BICYCLE', 'StopTime', 'length(new_speed)');

out=sim('BICYCLE');
MET = (out.MET);
MET = MET(1,:);
MET = [1,MET];
%%

% MET : Metabolic Equivalent of Task (MET)
dt_Burned_cal = zeros(1, length(new_speed));
Burned_cal = zeros(1, length(new_speed));
burned_cal = 0;

for i = 2:length(new_speed)
    dt_burned_cal = MET(i)*W*(new_t(i) - new_t(i-1))*(1/60)*(1/60);
    dt_Burned_cal(i) = dt_burned_cal;
    burned_cal = burned_cal + dt_burned_cal;
    Burned_cal(i) = burned_cal;
end
end
% total burned calories(kcal) = sum{각 활동별MET*체중*소비시간(min)/60(min)}
% 1분당 소모한 칼로리(kcal) : 분당MET*체중*1(분)/60(분)
% dT당 소모한 칼로리(kcal) : dT당MET*체중*{(t2-t1)sec*(1min/60sec)}/60min
% https://e-jnh.org/DOIx.php?id=10.4163/jnh.2021.54.2.129#__ID_SECTION_2

