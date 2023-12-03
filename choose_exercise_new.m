function varargout = choose_exercise_new(varargin)
% CHOOSE_EXERCISE_NEW MATLAB code for choose_exercise_new.fig
%      CHOOSE_EXERCISE_NEW, by itself, creates a new CHOOSE_EXERCISE_NEW or raises the existing
%      singleton*.
%
%      H = CHOOSE_EXERCISE_NEW returns the handle to a new CHOOSE_EXERCISE_NEW or the handle to
%      the existing singleton*.
%
%      CHOOSE_EXERCISE_NEW('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHOOSE_EXERCISE_NEW.M with the given input arguments.
%
%      CHOOSE_EXERCISE_NEW('Property','Value',...) creates a new CHOOSE_EXERCISE_NEW or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before choose_exercise_new_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to choose_exercise_new_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help choose_exercise_new

% Last Modified by GUIDE v2.5 03-Dec-2023 15:49:46

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @choose_exercise_new_OpeningFcn, ...
                   'gui_OutputFcn',  @choose_exercise_new_OutputFcn, ...
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


% --- Executes just before choose_exercise_new is made visible.
function choose_exercise_new_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to choose_exercise_new (see VARARGIN)

% Choose default command line output for choose_exercise_new
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

menu('칼로리,몸무게는 숫자만 입력해주세요.','네');
% UIWAIT makes choose_exercise_new wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = choose_exercise_new_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;




% --- Executes on button press in pushbutton_ok.
function pushbutton_ok_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%ce = choose exercise
ce.exercise = handles.exercise;
ce.wight = handles.wight;
save('choose__exercise','ce');
close;
main_new;

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
