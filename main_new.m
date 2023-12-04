function varargout = main_new(varargin)
% MAIN_NEW MATLAB code for main_new.fig
%      MAIN_NEW, by itself, creates a new MAIN_NEW or raises the existing
%      singleton*.
%
%      H = MAIN_NEW returns the handle to a new MAIN_NEW or the handle to
%      the existing singleton*.
%
%      MAIN_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN_NEW.M with the given input arguments.
%
%      MAIN_NEW('Property','Value',...) creates a new MAIN_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main_new

% Last Modified by GUIDE v2.5 04-Dec-2023 19:06:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_new_OpeningFcn, ...
                   'gui_OutputFcn',  @main_new_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main_new is made visible.
function main_new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main_new (s"건강할때 건강을 지키는 것에는 실로 대단한 결단이 필요하다 - 제러미ee VARARGIN)
gaethingun{1,1} = "건강할때 건강을 지키는 것에는 실로 대단한 결단이 필요하다 - 제러미 벤덤";
gaethingun{2,1} = "남들이 그만둘 때, 난 계속한다 - 라자르 안젤로프";
gaethingun{3,1} = "간단해요, 흔들리면 그건 지방이예요 - 아놀드 슈왈제네거";
gaethingun{4,1} = "운동은 몸을 바꾸는 것뿐만 아니라 마음을 바꾸기도 한다. - 조셉 프리스트리";
gaethingun{5,1} = "가장 큰 적은 나 자신의 내면의 나태함이다. - 윌리엄 셰익스피어";
gaethingun{6,1} = "당신이 할 수 있다고 믿든, 할 수 없다고 믿든, 그렇게 될 것이다. - 헨리 포드";
gaethingun{7,1} = "건강한 마음은 건강한 몸에서 시작된다. - 미스터 T";

rnd_number=rand(1);
if rnd_number<(1/7)
    set(handles.edit_title,'String',gaethingun{1,1});
elseif rnd_number<(2/7)
    set(handles.edit_title,'String',gaethingun{2,1});
elseif rnd_number<(3/7)
    set(handles.edit_title,'String',gaethingun{3,1});    
elseif rnd_number<(4/7)
    set(handles.edit_title,'String',gaethingun{4,1});
elseif rnd_number<(5/7)
    set(handles.edit_title,'String',gaethingun{5,1});
elseif rnd_number<(6/7)
    set(handles.edit_title,'String',gaethingun{6,1});
else
    set(handles.edit_title,'String',gaethingun{7,1});
end

load("choose__exercise.mat");

handles.exercise = ce.exercise;
handles.wight = ce.wight;
handles.m=load('GPS.mat', 'm');


%%%%%%%%%%%%%%%%%%%%%% 걸음 수 표시를 위한 세팅
[a,t] = accellog(handles.m.m); %모바일 센서 데이터를 순서대로 변수 지정
%%%주의%%%
%GPS.m 파일과 t 값이 달라질 수 있음. 함수 사용시 t 사이즈 유의할 것
%accellog로 t 변수 지정 시, t1 t2등 다른 t 사용 추천
%보고서에 이 내용 추가할 것

%각 시점의 XYZ 벡터를 스칼라 값으로 변환
x = a(:,1);
y = a(:,2);
z = a(:,3);
%전제 가속드의 크기
mag = sqrt(sum(x.^2 + y.^2 + z.^2, 2));
%중력가속도(9.8) 제거를 위해 데이터에서 평균값 제거
magNoG = mag - mean(mag);

%%%%주의%%%%
%Signal Processing Toolbox 애드온 필요%
%최소 높이에서 1 표준편차 위에 해당하는 피크만 걸음으로 처리
minPeakHeight = std(magNoG);
%가속도 변화 그래프의 peak 지정
[pks,locs] = findpeaks(magNoG,'MINPEAKHEIGHT',minPeakHeight);
%peak 수를 기반으로 걸음수 지정
numSteps = numel(pks);
if strcmp(handles.exercise, 'cycle')
    set(handles.edit_step,'String','측정할 수 없습니다.');
else
    set(handles.edit_step,'String',num2str(numSteps));
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[lat,lon,t1,spd] = poslog(handles.m.m);


if strcmp(handles.exercise, 'walk')
    [time,dt_Burned_cal,Burned_cal] = interp_walking_cal(t1,spd,handles.wight);
elseif strcmp(handles.exercise, 'run')
    [time,dt_Burned_cal,Burned_cal] = interp_running_cal(t1,spd,handles.wight);
else
    [time,dt_Burned_cal,Burned_cal] = interp_bicycle_cal(t1,spd,handles.wight);
end
handles.time = time;
handles.dt_Burned_cal = dt_Burned_cal;
handles.Burned_cal = Burned_cal;

axes(handles.axis_total_cal)
plot(handles.time,Burned_cal);
title(handles.axis_total_cal,'Total Kcal')
xlabel(handles.axis_total_cal,'sec')
ylabel(handles.axis_total_cal,'Kcal')

axes(handles.axes_instant_cal)
plot(handles.time, dt_Burned_cal);
title(handles.axes_instant_cal,'Instant Kcal')
xlabel(handles.axes_instant_cal,'sec')
ylabel(handles.axes_instant_cal,'Kcal')

set(handles.edit_burned_cal,'String',num2str(max(Burned_cal)));

tt = t1(end);
hours = floor(tt / 3600);
minutes = floor(mod(tt, 3600) / 60);
seconds = mod(tt, 60);
tt1 = sprintf('%2.0f시간 %2.0f분 %2.0f초', hours, minutes, seconds);

set(handles.edit_exeercise_time,'String',tt1);

% Choose default command line output for main_new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main_new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit_burned_cal_Callback(hObject, eventdata, handles)
% hObject    handle to edit_burned_cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_burned_cal as text
%        str2double(get(hObject,'String')) returns contents of edit_burned_cal as a double



% --- Executes during object creation, after setting all properties.
function edit_burned_cal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_burned_cal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end






function edit_title_Callback(hObject, eventdata, handles)
% hObject    handle to edit_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_title as text
%        str2double(get(hObject,'String')) returns contents of edit_title as a double


% --- Executes during object creation, after setting all properties.
function edit_title_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_title (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_map.
function pushbutton_map_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_map (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[lat,lon,t1,spd] = poslog(handles.m.m);   %모바일 센서 데이터를 순서대로 변수 지정
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



function edit_step_Callback(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_step as text
%        str2double(get(hObject,'String')) returns contents of edit_step as a double



% --- Executes during object creation, after setting all properties.
function edit_step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_exeercise_time_Callback(hObject, eventdata, handles)
% hObject    handle to edit_exeercise_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_exeercise_time as text
%        str2double(get(hObject,'String')) returns contents of edit_exeercise_time as a double


% --- Executes during object creation, after setting all properties.
function edit_exeercise_time_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_exeercise_time (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
