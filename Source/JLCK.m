function varargout = JLCK(varargin)
% JLCK MATLAB code for JLCK.fig
%      JLCK, by itself, creates a new JLCK or raises the existing
%      singleton*.
%
%      H = JLCK returns the handle to a new JLCK or the handle to
%      the existing singleton*.
%
%      JLCK('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JLCK.M with the given input arguments.
%
%      JLCK('Property','Value',...) creates a new JLCK or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before JLCK_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to JLCK_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help JLCK

% Last Modified by GUIDE v2.5 25-Oct-2019 12:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @JLCK_OpeningFcn, ...
                   'gui_OutputFcn',  @JLCK_OutputFcn, ...
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


% --- Executes just before JLCK is made visible.
function JLCK_OpeningFcn(hObject, eventdata, handles, varargin)

set(gcf,'numbertitle','off','name','查看记录')

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to JLCK (see VARARGIN)

% Choose default command line output for JLCK
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes JLCK wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = JLCK_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
%qingkong
cla(gca);
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
%上一页
global k
global record

if (k==1)
    msgbox('当前为第一页','错误','error');
else
    k=k-1;
    imagesc(record(:,:,k));
                 title(['合成地震记录 第 ',num2str(k),' 炮'])
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
%下一页
global k
global record
global z_

if (k== z_)
    msgbox('当前为最后一页','错误','error');
else
    k=k+1;
    imagesc(record(:,:,k));
     title(['合成地震记录 第 ',num2str(k),' 炮'])
end
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
%跳转时间
global k
global record
global z_
time = str2double(get(handles.edit1,'string'));
k = time;
if( k<1 || k>z_)
    msgbox('超限','错误','error');
else
         imagesc(record(:,:,k));
          title(['合成地震记录 第 ',num2str(k),' 炮'])
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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
[file_name,path_name] = uigetfile({'*.mat';'*.dat';'*.txt'},'打开文件');
file_path = [path_name file_name] ;
global record
if (strcmp(file_name(end-3:end) , '.mat'))
    b=whos('-file',file_path);
    c=size(b);
    if(sum(c) ~= 2)
        errordlg('输入数据应只包含一个变量','错误','modal');
        return
    end
end
record = cell2mat(struct2cell(load(file_path))) ;
aa = msgbox('导入成功','OK','help');
pause(1)
delete(aa)
global x_
global y_
global z_
global k
k = 1;
[x_,y_,z_] = size(record);
imagesc(record(:,:,1));
 title(['合成地震记录 第 ',num2str(k),' 炮'])

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
