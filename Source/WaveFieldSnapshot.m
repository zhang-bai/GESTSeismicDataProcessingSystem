function varargout = WaveFieldSnapshot(varargin)
% WAVEFIELDSNAPSHOT MATLAB code for WaveFieldSnapshot.fig
%      WAVEFIELDSNAPSHOT, by itself, creates a new WAVEFIELDSNAPSHOT or raises the existing
%      singleton*.
%
%      H = WAVEFIELDSNAPSHOT returns the handle to a new WAVEFIELDSNAPSHOT or the handle to
%      the existing singleton*.
%
%      WAVEFIELDSNAPSHOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WAVEFIELDSNAPSHOT.M with the given input arguments.
%
%      WAVEFIELDSNAPSHOT('Property','Value',...) creates a new WAVEFIELDSNAPSHOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WaveFieldSnapshot_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WaveFieldSnapshot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WaveFieldSnapshot

% Last Modified by GUIDE v2.5 14-Oct-2019 22:50:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WaveFieldSnapshot_OpeningFcn, ...
                   'gui_OutputFcn',  @WaveFieldSnapshot_OutputFcn, ...
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

load u.mat
load md.txt
load record.mat
global u
global mdd
global rrecord
mdd= md;
u=uu;
rrecord =record;

% --- Executes just before WaveFieldSnapshot is made visible.
function WaveFieldSnapshot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WaveFieldSnapshot (see VARARGIN)
set(gcf,'NumberTitle','off','Name','marmousi 模型 - 波场快照');
% Choose default command line output for WaveFieldSnapshot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WaveFieldSnapshot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WaveFieldSnapshot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
%生成波场快照
global val 
val =1;


% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)

% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
%开始
global u
global mdd
global val
global k
global page
page =1;
val=1;
N=100;X=384+N*2;Z=122+N*2;
dh=10;dk=10;dt=0.001;endt=1.2;
[a,b]=meshgrid(0:24:24*383,0:24:24*121);
k=1;
while(k<=60)
        if (val)
                imagesc(0:24:24*383,0:24:24*121,u(:,:,k),[-1,1])
                 title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,mdd,'k')
                 hold on
                 plot(24*(384)/2,20,'pr','MarkerSize',13)
                 text(24*(384)/2+35,80,'震源','FontSize',11)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
               k=k+1;
        else
            break;
        end
        pause(0.1)
end      




% --- Executes on button press in togglebutton1.
function togglebutton1_Callback(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton1


% --- Executes on key press with focus on togglebutton1 and none of its controls.
function togglebutton1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to togglebutton1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
%上一页
global k
global u 
global a 
global b 
global mdd
global val
global page
if(val == 0 && page == 0)   %判断之前操作是否为暂停
    k=k-1;
    page = 1;
end

if (k==1)
    msgbox('当前为第一页','错误','error');
else
    k=k-1;
     imagesc(0:24:24*383,0:24:24*121,u(:,:,k),[-1,1])
                 title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,mdd,'k')
                 hold on
                 plot(24*(384)/2,20,'pr','MarkerSize',13)
                 text(24*(384)/2+35,80,'震源','FontSize',11)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
end

    

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
%下一页
global k
global val
global u 
global a 
global b 
global mdd
global page
if (val == 0 && page == 0)
    k=k-1;
    page =1;
end
if (k==60)
    msgbox('当前为最后一页','错误','error');
else
    k=k+1;
     imagesc(0:24:24*383,0:24:24*121,u(:,:,k),[-1,1])
                 title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,mdd,'k')
                 hold on
                 plot(24*(384)/2,20,'pr','MarkerSize',13)
                 text(24*(384)/2+35,80,'震源','FontSize',11)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
end




% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
%跳转时间
global k
global u 
global a 
global b 
global mdd
time = str2double(get(handles.edit1,'string'));
k = round(time/0.02 );
if( k<1 || k>60)
    msgbox('时间超限','错误','error');
else
         imagesc(0:24:24*383,0:24:24*121,u(:,:,k),[-1,1])
                 title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,mdd,'k')
                 hold on
                 plot(24*(384)/2,20,'pr','MarkerSize',13)
                 text(24*(384)/2+35,80,'震源','FontSize',11)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
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


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
global val
global page
if(val == 0)
    val=1;
    page =1;
else
    val = 0;
    page = 0;
    return;
end
global k
global u
global mdd
global a
global b
    [a,b]=meshgrid(0:24:24*383,0:24:24*121);
    
while(k<=60)
    if (val)
                imagesc(0:24:24*383,0:24:24*121,u(:,:,k),[-1,1])
                 title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,mdd,'k')
                 hold on
                 plot(24*(384)/2,20,'pr','MarkerSize',13)
                 text(24*(384)/2+35,80,'震源','FontSize',11)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
               k=k+1;
    else break;
    end
    pause(0.1)
end
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
cla(gcf)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.

% hObject    handle to axes3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes3


% --- Executes during object creation, after setting all properties.

% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes during object creation, after setting all properties.



% --- Executes during object creation, after setting all properties.

% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
%保存图标
[filename,pathname] = uiputfile({'*.jpg';'*.bmp';'*.gif';'*.png';'*.tif'}, 'Write Pic');
str=[pathname filename];
if str~=0
    saveas(gcf,str);  
end

% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes7_CreateFcn(hObject, eventdata, handles)
%生成模型图
%插值数据大小122*384，网格间距24m*24m
global mdd
N=100;X=384+N*2;Z=122+N*2;
h = imagesc(0:24:24*383,0:24:24*121,mdd);
% imshow(0:24:24*121,0:24:24*384,vv(N+1:Z-N,N+1:X-N))
% imagesc(0:24:24*121,0:24:24*384,vv(N+1:Z-N,N+1:X-N))
title('marmousi 速度模型')
ylabel('深度 / m')
xlabel('X / m')
h=colorbar;
set(get(h,'Title'),'string','v (m/s)');
colormap(jet)
hold on
plot(24*(X-2*N)/2,20,'pr','MarkerSize',13)

% hObject    handle to axes7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes7
