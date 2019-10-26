function varargout = launch(varargin)
% LAUNCH MATLAB code for launch.fig
%      LAUNCH, by itself, creates a new LAUNCH or raises the existing
%      singleton*.
%
%      H = LAUNCH returns the handle to a new LAUNCH or the handle to
%      the existing singleton*.
%
%      LAUNCH('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAUNCH.M with the given input arguments.
%
%      LAUNCH('Property','Value',...) creates a new LAUNCH or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before launch_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to launch_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help launch

% Last Modified by GUIDE v2.5 24-Oct-2019 18:28:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @launch_OpeningFcn, ...
                   'gui_OutputFcn',  @launch_OutputFcn, ...
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


% --- Executes just before launch is made visible.
function launch_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to launch (see VARARGIN)
set(gcf,'NumberTitle','off','Name','登录-GEST地震数据处理系统 v1.0');
% Choose default command line output for launch
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes launch wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = launch_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles) 
%用户名输入窗口
global cName
% set(hObject,'string',''); %清空用户名
% nName = str2double(get(hObject,'String'));%要求用户名为数字（手机号）
cName = get(hObject,'String');
t = length(cName);
if (  t~=11 && cName(1)~='1')
    set(hObject,'string',''); %清空用户名
    errordlg('用户名为11位手机号码','错误提醒','modal')
    return;
end
    
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
%密码窗口
% set(hObject,'string',''); %清空用户名
global cCode
% nCode = str2double(get(hObject,'String'));
cCode = get(hObject,'String');
k = length(cCode);
if (k<6)
    errordlg('密码必须大于6位','错误提醒','modal');
    return;
end


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
% 登录按钮
global cName;
global cCode;
if( ~strcmp(cName,'12345678910') || ~strcmp(cCode , '971122') )
    errordlg('用户名或密码错误','错误提醒','modal');
    set(handles.edit2,'string','');
    return;
else
    close;
    GEST;
    
end


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on edit2 and none of its controls.
function edit2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over edit1.
function edit1_ButtonDownFcn(hObject, eventdata, handles)
%用户名
set(hObject,'String','','Enable','on');
set(hObject,'ForegroundColor',[0,0,0]);
uicontrol(hObject);



% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
%背景图
% ha=axes('units','normalized','pos',[0 0 1 1]);
% uistack(ha,'down');
% ii=imread('b1.jpg');
% image(ii);
% colormap gray
% set(ha,'handlevisibility','off','visible','on');
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
