function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 29-Nov-2023 23:34:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
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


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to main (see VARARGIN)
gaethingun{1,1} = "건강할때 건강을 지키는 것에는 실로 대단한 결단이 필요하다 - 제러미 벤덤";
gaethingun{2,1} = "남들이 그만둘 때, 난 계속한다 - 라자르 안젤로프";
gaethingun{3,1} = "간단해요, 흔들리면 그건 지방이예요 - 아놀드 슈왈제네거";
gaethingun{4,1} = "운동은 몸을 바꾸는 것뿐만 아니라 마음을 바꾸기도 한다. - 조셉 프리스트리";
gaethingun{5,1} = "가장 큰 적은 나 자신의 내면의 나태함이다. - 윌리엄 셰익스피어";
gaethingun{6,1} = "목표를 이루려면 우리는 희생을 해야하지만, 그 희생이 나에게 무엇인지를 알아야 한다. - 마하트마 간디";
gaethingun{7,1} = "훌륭한 몸을 갖기 위해선 고생이 필요하다. 그러나 그 고생이 결국엔 보상받게 된다. - 마이클 조던";
gaethingun{8,1} = "당신은 지금까지 얼마나 노력했느냐보다 얼마나 오래 노력했느냐가 더 중요하다. - 퍼시 실튼";
gaethingun{9,1} = "당신이 할 수 있다고 믿든, 할 수 없다고 믿든, 그렇게 될 것이다. - 헨리 포드";
gaethingun{10,1} = "건강한 마음은 건강한 몸에서 시작된다. - 미스터 T";

rnd_number=rand(1);
if rnd_number<0.1
    set(handles.edit_title,'String',gaethingun{1,1});
elseif rnd_number<0.2
    set(handles.edit_title,'String',gaethingun{2,1});
elseif rnd_number<0.3
    set(handles.edit_title,'String',gaethingun{3,1});    
elseif rnd_number<0.4
    set(handles.edit_title,'String',gaethingun{4,1});
elseif rnd_number<0.5
    set(handles.edit_title,'String',gaethingun{5,1});
elseif rnd_number<0.6
    set(handles.edit_title,'String',gaethingun{6,1});
elseif rnd_number<0.7
    set(handles.edit_title,'String',gaethingun{7,1});
elseif rnd_number<0.8
    set(handles.edit_title,'String',gaethingun{8,1});
elseif rnd_number<0.9
    set(handles.edit_title,'String',gaethingun{9,1});
else rnd_number<=1
    set(handles.edit_title,'String',gaethingun{10,1});
end

load("choose__exercise.mat");
set(handles.edit_wcal,'String',ce.wcal);
handles.exercise = ce.exercise;
handles.wight = ce.wight;

% Choose default command line output for main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes main wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = main_OutputFcn(hObject, eventdata, handles) 
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



function edit_wcal_Callback(hObject, eventdata, handles)
% hObject    handle to edit_wcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_wcal as text
%        str2double(get(hObject,'String')) returns contents of edit_wcal as a double


% --- Executes during object creation, after setting all properties.
function edit_wcal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_wcal (see GCBO)
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


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

axis([126.881 126.887 37.485 37.5])
image([126.881 126.887], [37.485 37.5], imread('map.png'));
for i = 1:length(handles.location.lat)
    plot(handles.location.log(i),handles.location.lat(i),'bo')
    pause(0.01)
end

% --- Executes on button press in pushbutton_data.
function pushbutton_data_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[fn,pa] = uigetfile({'nmea_test.m'});
cpath = pwd;
cd(pa);
nmea_test;

eval('load location.mat');
cd(cpath);
handles.location = location;
handles.output = hObject;
guidata(hObject,handles);
