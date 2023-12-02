function velocity = cal_velocity(latitude, longitude, time)
% velocity = cal_velocity(latitude, longitude, time)
% i = 2:length(time) 벡터 크기 조심
% time의 크기가 velocity의 크기보다 하나 더 큼
% 21013292 박재두

% 위도, 경도, 시간을 사용하여 속도 계산
% latitude: 위도(degree) 벡터
% longitude: 경도(degree) 벡터
% time: 시간 벡터

% Haversine 공식사용 예정  https://en.wikipedia.org/wiki/Haversine_formula
% The haversine formula determines the great-circle distance between two points on a sphere given their longitudes and latitudes.
% haversine공식은 경도와 위도가 주어진 구의 두 점 사이의 대원거리를 계산.

lat = deg2rad(latitude); % 위도, 경도를 라디안으로 변환
lon = deg2rad(longitude);
r = 6388.5; % {적도 반지름(6378km)+극 반지름(6357km)}/2=6388.5km

% 각 시간의 거리
distance = zeros(size(time));
for i = 2:length(time) % 전 데이터와 비교하려면 2부터 시작해야함
    delta_lat = lat(i) - lat(i-1); % 위도 차이
    delta_lon = lon(i) - lon(i-1); % 경도 차이

    d_root_inner = sin(delta_lat/2)^2 + cos(lat(i-1))*cos(lat(i)) * sin(delta_lon/2)^2; % d의 루트안에 들어가는 다항식
    distance(i) = 2*r*asin((sqrt(d_root_inner)));
end

% 각 시간에서의 속도(km/h)
time_diff = diff(time); % diff사용 lesson07참조
velocity = distance(2:end) ./ time_diff;

end