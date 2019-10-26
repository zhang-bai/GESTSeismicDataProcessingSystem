function varargout = marmousi(varargin)
% MARMOUSI MATLAB code for marmousi.fig
%      MARMOUSI, by itself, creates a new MARMOUSI or raises the existing
%      singleton*.
%
%      H = MARMOUSI returns the handle to a new MARMOUSI or the handle to
%      the existing singleton*.
%
%      MARMOUSI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MARMOUSI.M with the given input arguments.
%
%      MARMOUSI('Property','Value',...) creates a new MARMOUSI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before marmousi_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to marmousi_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help marmousi

% Last Modified by GUIDE v2.5 14-Oct-2019 22:38:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @marmousi_OpeningFcn, ...
                   'gui_OutputFcn',  @marmousi_OutputFcn, ...
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
% load u.mat
load md.txt
% load record.mat
% global u
global mdd
mdd = md;
% rrecord =record;

% --- Executes just before marmousi is made visible.
function marmousi_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to marmousi (see VARARGIN)
set(gcf,'NumberTitle','off','Name','marmousi ģ��');
% Choose default command line output for marmousi
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes marmousi wait for user response (see UIRESUME)
% uiwait(handles.figure1);





% --- Outputs from this function are returned to the command line.
function varargout = marmousi_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
%��������
WaveFieldSnapshot;
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
%�ϳɵ����¼
global rrecord
% figure
% imagesc(0:10:3840,0:1200,rrecord)
%    colormap(gray)
% colorbar
% xlabel('X-m')
% ylabel('t-ms')
% title('�ϳɵ����¼')
%  h2=colorbar;
%  set(get(h2,'Title'),'string','u ');
wigg(rrecord,10,1,5)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)


% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.


% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function uipanel3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)



% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
%����˵��
str=['�Ҳ�Ϊmarmousiģ�͵��ٶ�-���ͼ������Ϊ��ࣨm��������Ϊ��ȣ�m������ͬ��ɫ����ͬ���ٶ�ֵ�������ٶȵ�λΪm/s',...
'�߽����PCL���գ������趨Ϊ100��',...
'������Դ�����׿��Ӳ�����Ƶ���趨Ϊ15Hz��',...
'��Դλ��Ϊ��1920��120������������Ǳ����'];
%  h=dialog('name','����');
%  uicontrol('parent',h,'style','text','string',str);
%  uicontrol('parent',h,'style','pushbutton','string','ȷ��','callback','delete(gcbf)');
msgbox(str,'����','help')

% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipushtool3_ClickedCallback(hObject, eventdata, handles)
% ����ͼƬ

[filename,pathname] = uiputfile({'*.jpg';'*.bmp';'*.gif';'*.png';'*.tif'}, '����ͼƬ');
str=[pathname filename];
if str~=0
    saveas(gcf,str);  
end
% hObject    handle to uipushtool3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel5_CreateFcn(hObject, eventdata, handles)

% hObject    handle to uipanel5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.


% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
%����ģ��ͼ
%��ֵ���ݴ�С122*384��������24m*24m
global mdd
N=100;X=384+N*2;Z=122+N*2;
h = imagesc(0:24:24*383,0:24:24*121,mdd);
% imshow(0:24:24*121,0:24:24*384,vv(N+1:Z-N,N+1:X-N))
% imagesc(0:24:24*121,0:24:24*384,vv(N+1:Z-N,N+1:X-N))
title('marmousi �ٶ�ģ��')
ylabel('��� / m')
xlabel('X / m')
h=colorbar;
set(get(h,'Title'),'string','v (m/s)');
colormap(jet)
hold on
dh =10;
plot(24*(X-2*N)/2,20,'pr','MarkerSize',13)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4
