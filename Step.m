[a,t] = accellog(m); %모바일 센서 데이터를 순서대로 변수 지정
%%%주의%%%
%GPS.m 파일과 t 값이 달라질 수 있음. 함수 사용시 t 사이즈 유의할 것
%accellog로 t 변수 지정 시, t1 t2등 다른 t 사용 추천
%보고서에 이 내용 추가할 것
figure(1)
plot(t,a); %가속도를 시간에 대해 plot, 그래프 해석을 위한 plot
legend('X', 'Y', 'Z');
xlabel('Relative time (s)');
ylabel('Acceleration (m/s^2)');

%각 시점의 XYZ 벡터를 스칼라 값으로 변환
x = a(:,1);
y = a(:,2);
z = a(:,3);
%전제 가속드의 크기
mag = sqrt(sum(x.^2 + y.^2 + z.^2, 2));
%중력가속도(9.8) 제거를 위해 데이터에서 평균값 제거
magNoG = mag - mean(mag);

%그래프 해석을 위한 plot
figure(2)
plot(t,magNoG);
xlabel('Time (s)');
ylabel('Acceleration (m/s^2)');

%%%%주의%%%%
%Signal Processing Toolbox 애드온 필요%
%최소 높이에서 1 표준편차 위에 해당하는 피크만 걸음으로 처리
minPeakHeight = std(magNoG);
%가속도 변화 그래프의 peak 지정
[pks,locs] = findpeaks(magNoG,'MINPEAKHEIGHT',minPeakHeight);
%peak 수를 기반으로 걸음수 지정
numSteps = numel(pks);

hold on;
plot(t(locs), pks, 'r', 'Marker', 'v', 'LineStyle', 'none');
title('Counting Steps');
xlabel('Time (s)');
ylabel('Acceleration Magnitude, No Gravity (m/s^2)');
hold off;