function varargout = choose__exercise(varargin)
% CHOOSE__EXERCISE MATLAB code for choose__exercise.fig
%      CHOOSE__EXERCISE, by itself, creates a new CHOOSE__EXERCISE or raises the existing
%      singleton*.
%
%      H = CHOOSE__EXERCISE returns the handle to a new CHOOSE__EXERCISE or the handle to
%      the existing singleton*.
%
%      CHOOSE__EXERCISE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSE__EXERCISE.M with the given input arguments.
%
%      CHOOSE__EXERCISE('Property','Value',...) creates a new CHOOSE__EXERCISE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choose__exercise_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choose__exercise_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choose__exercise

% Last Modified by GUIDE v2.5 27-Nov-2023 17:23:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choose__exercise_OpeningFcn, ...
                   'gui_OutputFcn',  @choose__exercise_OutputFcn, ...
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


% --- Executes just before choose__exercise is made visible.
function choose__exercise_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choose__exercise (see VARARGIN)

% Choose default command line output for choose__exercise
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

menu('칼로리,몸무게는 숫자만 입력해주세요.','네');
% UIWAIT makes choose__exercise wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choose__exercise_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function wcal_Callback(hObject, eventdata, handles)
% hObject    handle to wcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cal = get(hObject, 'String');
wcal = str2num(cal);
handles.wcal = wcal;
guidata(hObject,handles);

% Hints: get(hObject,'String') returns contents of wcal as text
%        str2double(get(hObject,'String')) returns contents of wcal as a double


% --- Executes during object creation, after setting all properties.
function wcal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wcal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ce = choose exercise
ce.exercise = handles.exercise;
ce.wcal = handles.wcal;
ce.wight = handles.wight;
save('choose__exercise','ce');
close

% --- Executes on button press in pushbutton_walk.
function pushbutton_walk_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_walk (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.exercise = 'walk';
guidata(hObject,handles);

% --- Executes on button press in pushbutton_run.
function pushbutton_run_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.exercise = 'run';
guidata(hObject,handles);

% --- Executes on button press in pushbutton_cycle.
function pushbutton_cycle_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_cycle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.exercise = 'cycle';
guidata(hObject,handles);



function wight_Callback(hObject, eventdata, handles)
% hObject    handle to wight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of wight as text
%        str2double(get(hObject,'String')) returns contents of wight as a double
wg = get(hObject, 'String');
wight = str2num(wg);
handles.wight = wight;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function wight_CreateFcn(hObject, eventdata, handles)
% hObject    handle to wight (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
