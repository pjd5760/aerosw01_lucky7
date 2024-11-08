function varargout = sw2023_third(varargin)
%%%%%%%%%%%%%%% pushbutton부만 확인하면됨
%%%%%%%%%%%%%%%


% SW2023_THIRD MATLAB code for sw2023_third.fig
%      SW2023_THIRD, by itself, creates a new SW2023_THIRD or raises the existing
%      singleton*.
%
%      H = SW2023_THIRD returns the handle to a new SW2023_THIRD or the handle to
%      the existing singleton*.
%
%      SW2023_THIRD('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SW2023_THIRD.M with the given input arguments.
%
%      SW2023_THIRD('Property','Value',...) creates a new SW2023_THIRD or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before sw2023_third_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to sw2023_third_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help sw2023_third

% Last Modified by GUIDE v2.5 28-Nov-2023 00:01:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @sw2023_third_OpeningFcn, ...
                   'gui_OutputFcn',  @sw2023_third_OutputFcn, ...
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


% --- Executes just before sw2023_third is made visible.
function sw2023_third_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to sw2023_third (see VARARGIN)

% Choose default command line output for sw2023_third
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes sw2023_third wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = sw2023_third_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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

first_edit1=get(handles.edit1 , 'String'); % first_edit1은 소모한 칼로리 량
ss=str2double(first_edit1); % 소모한 칼로리 string이면 숫자로 바꾸기

if ss<=100       % % % % % % 칼로리 나눌거면 이렇게하거나, []로 목록만들고 값넣기
    ssr='meat';
elseif ss<=200
    ssr='meat2';
elseif ss<=300
    ssr='meat3';
else
    ssr='meat99';
end


set(handles.edit2,'String',ssr);% 표현부 edit2는 gui에서 아래에 있는 push버튼
%% 사용한 변수 pushbutton1=edit1, pushbutton2=edit2, ss=pushbutton1의 정수값(소모한 칼로리량정수값)
% %%  ssr=버튼 2에서표현될 음식 이름 
