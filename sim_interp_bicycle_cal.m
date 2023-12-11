% function [time,dt_Burned_cal,Burned_cal] = sim_interp_bicycle_cal(T,SPD,W)
% [time,dt_Burned_cal,Burned_cal] = interp_bicycle_cal_matonly(Time,speed,Body Wegiht)
% time(sec) : (열백터)
% Burned_cal(kcal): 누적된 칼로리 소모량(열백터)
% dt_Burned_cal(kcal): 순간 칼로리 소모량(열벡터)
% 21013292 박재두

% T(sec) : 측정 후 지난 시간(열벡터)
% SPD(km) : 측정 시각의 속도(열벡터)
% W(kg) : 몸무게(스칼라)


% script용도 주석 네이버 기준 80kg 60분 running 588kcal소모
clear;clc
T = 1:1:3600;
SPD = 12 *rand(1,length(T));
W = 80;
T=T'; % 시간 열벡터로 받아옴
SPD=SPD'; % 속도 열베거로 받아옴

% 시뮬링크 source로 사용하기 위한 열벡터를 행벡터로
SPD = [T,SPD]';
T = [T,T]';

open_system('BICYCLE');
set_param('BICYCLE/Gain_W1','Gain',num2str(W)); % dt_Burned_cal
set_param('BICYCLE/Gain_W2','Gain',num2str(W)); % Burned_cal
out=sim('BICYCLE');
time=out.time;
dt_Burned_cal=out.dt_Burned_cal;
Burned_cal=out.Burned_cal;

% end
% total burned calories(kcal) = sum{각 활동별MET*체중*소비시간(min)/60(min)}
% 1분당 소모한 칼로리(kcal) : 분당MET*체중*1(분)/60(분)
% dT당 소모한 칼로리(kcal) : dT당MET*체중*{(t2-t1)sec*(1min/60sec)}/60min
% https://e-jnh.org/DOIx.php?id=10.4163/jnh.2021.54.2.129#__ID_SECTION_2

