function varargout = THREE(varargin)
% THREE MATLAB code for THREE.fig
%      THREE, by itself, creates a new THREE or raises the existing
%      singleton*.
%
%      H = THREE returns the handle to a new THREE or the handle to
%      the existing singleton*.
%
%      THREE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in THREE.M with the given input arguments.
%
%      THREE('Property','Value',...) creates a new THREE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before THREE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to THREE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help THREE

% Last Modified by GUIDE v2.5 25-Oct-2019 00:43:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @THREE_OpeningFcn, ...
                   'gui_OutputFcn',  @THREE_OutputFcn, ...
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


% --- Executes just before THREE is made visible.
function THREE_OpeningFcn(hObject, eventdata, handles, varargin)

set(gcf,'numbertitle','off','name','�������ģ��')
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to THREE (see VARARGIN)

% Choose default command line output for THREE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes THREE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = THREE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --------------------------------------------------------------------
function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_12_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_2_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_7_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_10_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_11_Callback(hObject, eventdata, handles)
SVI
% hObject    handle to Untitled_11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_16_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_9_Callback(hObject, eventdata, handles)
% �������
global data_noise
[file_name,path_name] = uigetfile({'*.mat';'*.dat';'*.txt'},'���ļ�');
file_path = [path_name file_name] ;
if (strcmp(file_name(end-3:end) , '.mat'))
    b=whos('-file',file_path);
    c=size(b);
    if(sum(c) ~= 2)
        errordlg('��������Ӧֻ����һ������','����','modal');
        return
    end
end
data_noise = cell2mat(struct2cell(load(file_path))) ;
aa = msgbox('����ɹ�,������Ӹ�˹����','OK','help');
pause(1)
delete(aa)

answer=inputdlg('������ֵ','input rand noise',[1 30],{'1'});
a = str2num(answer{1});

[nx,ny,nz]=size(data_noise);
noise = data_noise + a*rand(nx,ny,nz) ;
[filename,pathname] = uiputfile({'*.mat';'*.dat';'*.txt'}, '���Ϊ');
str=[pathname filename]
save(str,'noise')
msgbox('�ļ��ѱ���','OK','help')

% hObject    handle to Untitled_9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_5_Callback(hObject, eventdata, handles)
% �����¼�Զ���ӳ
[file_name,path_name] = uigetfile({'*.mat';'*.dat';'*.txt'},'���ļ�');
file_path = [path_name file_name] ;
global record
if (strcmp(file_name(end-3:end) , '.mat'))
    b=whos('-file',file_path);
    c=size(b);
    if(sum(c) ~= 2)
        errordlg('��������Ӧֻ����һ������','����','modal');
        return
    end
end
record = cell2mat(struct2cell(load(file_path))) ;
aa = msgbox('����ɹ�','OK','help');
pause(1)
delete(aa)

[nx,ny,nz] =  size(record);

for i = 1:nz
    figure(1)
    imagesc(record(:,:,i));
      title(['�ϳɵ����¼ �� ',num2str(i),' ��'])
    pause(0.1)
end
% hObject    handle to Untitled_5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_6_Callback(hObject, eventdata, handles)
% �����¼����鿴
JLCK
% hObject    handle to Untitled_6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_13_Callback(hObject, eventdata, handles)
%����ģ��
global dh
global dk
global dt
global N
global V
global v
global Z
global X

if ( isempty(dk) )
    errordlg('���ȵ����ٶ�ģ��','����','modal');
    return;
end

if ( isempty(N) )
    errordlg('�����������ղ���','����','modal');
    return;
end

answer=inputdlg({'�ڵ�λ�ã�������/m��','�ڵ���ȣ�������/m��', 'dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','����ʱ��',},'������',[1 30;1 30;1 30;1 30;1 30],{'5','5','0.001','25','0.3'});

pos_x =round((str2num(answer{1}))/dh);
pos_y =round((str2num(answer{2}))/dk);
dt =str2num(answer{3});
fm =str2num(answer{4});
endt = str2num(answer{5});

if (round((str2num(answer{1}))/dh) <1 || round((str2num(answer{2}))/dk <1))
    errordlg('�ڵ�ӦΪʵ��λ�ú����','��������','modal');
    return;
end


if ( max(max(v))*dt/dh >= 1/sqrt(2) )
    errordlg( 'ERROR!!! �������ȶ�����������ǰ Vmax*dt/dh >= 1/sqrt(2)');
    return
end
if ( dh > min(min(v))/16/fm )
    warndlg('���С x �Ĳ����Լ���Ƶɢ' );
    return;
end


a = questdlg('�Ƿ񱣴�ϳɵ����¼','������ʾ','Yes','No','Yes'); 

Sx=pos_x+N;Sz=pos_y+N;                    %��Դλ��
u=zeros(Z + 2*N,X+2*N,3);           %��ʼ��λ��Ϊ0
DT=Dt(Sz,Sx,Z+2*N,X+2*N);               %��ʼ���ĺ���
[weakx ,weakz]=attnuate(Z+2*N,X+2*N,N);

 k=1;

    for number=2:round(endt/dt)
        for i=2:Z-1+2*N
            for j=2:X-1+2*N
               u(i,j,mod(k+2,3)+1)=(dt^2*V(i,j)^2/dh^2*(u(i+1,j,mod(k+1,3)+1)+u(i-1,j,mod(k+1,3)+1)-2*u(i,j,mod(k+1,3)+1))+(2-weakx(i,j)^2*dt^2)*u(i,j,mod(k+1,3)+1)/2+(weakx(i,j)*dt-1)*u(i,j,mod(k,3)+1)/2)/(weakx(i,j)*dt+1)...
                                   +(dt^2*V(i,j)^2/dk^2*(u(i,j+1,mod(k+1,3)+1)+u(i,j-1,mod(k+1,3)+1)-2*u(i,j,mod(k+1,3)+1))+(2-weakz(i,j)^2*dt^2)*u(i,j,mod(k+1,3)+1)/2+(weakz(i,j)*dt-1)*u(i,j,mod(k,3)+1)/2)/(weakz(i,j)*dt+1)...
                                   +DT(i,j)*ricker(number*dt-dt,fm);          
            end
        end
                      k=mod(k,3)+1;
                      if (strcmp(a,'Yes'))
                      record(number-1,:)=u(Sz,N+1:X+N,k);
                      end
                     figure(1)
                    imagesc(u(:,:,k));
                    title(['3 layers model snapshot ' ,num2str(dt*number) ,' s'])
                    
                    h = colorbar;
                    set(get(h,'Title'),'string','u');
                    pause(0.001)
    end
 if (strcmp(a,'Yes'))
    [filename,pathname] = uiputfile({'*.mat';'*.dat';'*.txt'}, '���Ϊ');
    str=[pathname filename];
    save(str,'record')
    msgbox('�ļ��ѱ���','OK','help')
 end
    
% hObject    handle to Untitled_13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_15_Callback(hObject, eventdata, handles)
%����ģ��
global V
global N
global X
global dk
global dh
global v
global Z

if ( isempty(dk) )
    errordlg('���ȵ����ٶ�ģ��','����','modal');
    return;
end

if ( isempty(N) )
    errordlg('�����������ղ���','����','modal');
    return;
end

answer=inputdlg({'�ڵ���ȣ�������/m��', 'dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','����ʱ��',},'������',[1 30;1 30;1 30;1 30],{'5','0.001','25','1.0'});
pos_y =round(str2num(answer{1})/dk)+N;
dt =str2num(answer{2});
fm =str2num(answer{3});
endt = str2num(answer{4});


if ( max(max(v))*dt/dh >= 1/sqrt(2) )
    errordlg( 'ERROR!!! �������ȶ�����������ǰ Vmax*dt/dh >= 1/sqrt(2)');
    return
end
if ( dh > min(min(v))/16/fm )
    warndlg('���С x �Ĳ����Լ���Ƶɢ' );
    return;
end

hh = waitbar(0,'���ڼ����ڵ�');

for zhenyan =1 :X
Sx=zhenyan+N;Sz=pos_y;                    %��Դλ��


u=zeros(Z + 2*N,X+2*N,3);           %��ʼ��λ��Ϊ0
DT=Dt(Sz,Sx,Z+2*N,X+2*N);               %��ʼ���ĺ���
[weakx ,weakz]=attnuate(Z+2*N,X+2*N,N);

 k=1;

    for number=1:endt/dt
        for i=2:Z-1+2*N
            for j=2:X-1+2*N
               u(i,j,mod(k+2,3)+1)=(dt^2*V(i,j)^2/dh^2*(u(i+1,j,mod(k+1,3)+1)+u(i-1,j,mod(k+1,3)+1)-2*u(i,j,mod(k+1,3)+1))+(2-weakx(i,j)^2*dt^2)*u(i,j,mod(k+1,3)+1)/2+(weakx(i,j)*dt-1)*u(i,j,mod(k,3)+1)/2)/(weakx(i,j)*dt+1)...
                                   +(dt^2*V(i,j)^2/dk^2*(u(i,j+1,mod(k+1,3)+1)+u(i,j-1,mod(k+1,3)+1)-2*u(i,j,mod(k+1,3)+1))+(2-weakz(i,j)^2*dt^2)*u(i,j,mod(k+1,3)+1)/2+(weakz(i,j)*dt-1)*u(i,j,mod(k,3)+1)/2)/(weakz(i,j)*dt+1)...
                                   +DT(i,j)*ricker(number*dt-dt,fm);
%                 u(i,j,k+1)=(v(i,j)*dt/dh)^2*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k))+(2*dh^2-4*v(i,j)^2*dt^2)/dh^2*u(i,j,k)-u(i,j,k-1)+DT(i,j)*ricker(k*dt-dt,fm)           ;
            end
        end
                 k=mod(k,3)+1;
                  record(number,:,zhenyan)=u(Sz,N+1:X+N,k);
                  
               
    end

    bb=num2str(zhenyan);
     s=['���ڽ��е� ' ,bb ,' ��'];
    waitbar(zhenyan/X,hh,s)  
%    record_noise(:,:,zhenyan-1)=record(:,:,zhenyan-1)+randn(endt/dt-1,X)*0.03;
end
delete(hh);
aa = msgbox('�������','OK','help');
pause(0.5)
delete(aa)

[filename,pathname] = uiputfile({'*.mat'}, '���Ϊ');
str=[pathname filename];
save(str,'record')
msgbox('�ļ��ѱ���','OK','help')


% hObject    handle to Untitled_15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_3_Callback(hObject, eventdata, handles)
%�½�ģ��
% dh=5;dk=5;dt=0.001;endt=0.21;   %dh,dk,dt�ֱ�Ϊx,z,t��������endtΪ��ֹʱ��
% fm=25;X=20;Z=160;              %�׿��Ӳ���Ƶ30Hz,�����С500*500
% N = 30;                               %   ���ղ��30
%  v1=3500;v2=2000;v3=3000;               %�ٶ�ģ��
% h1 = 4/16;
% h2 = 6/16;
% h3 = 6/16;                                              %ģ�ͺ��ռ��

% answer=inputdlg({'X(�����С)','Z(�����С)','N(���ձ߽����)','dh(x������)','dk(z������)','dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','v1(���ٶ�)','v2(���ٶ�)','v3(���ٶ�)','h1(��һ��ռ��)','h2(�ڶ���ռ��)','h3(������ռ��)'},'������',[1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30],{'40','160','30','5','5','0.001','25','3500','2000','3000','0.25','0.375','0.375'});
answer=inputdlg({'X(�����С)','Z(�����С)','dh(x������)','dk(z������)','v1(���ٶ�)','v2(���ٶ�)','v3(���ٶ�)','h1(��һ��ռ��)','h2(�ڶ���ռ��)','h3(������ռ��)'},'������',[1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30],{'40','160','5','5','3500','2000','3000','0.25','0.375','0.375'});
global v
global dh
global dk
global X 
global Z
% 'dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','����ʱ��'
X =(str2num(answer{1}));
Z =(str2num(answer{2}));
dh= (str2num(answer{3}));
dk =(str2num(answer{4}));
v1 =(str2num(answer{5}));
v2=(str2num(answer{6}));
v3=(str2num(answer{7}));
h1=(str2num(answer{8}));
h2=(str2num(answer{9}));
h3=(str2num(answer{10}));



v=[v1*ones(round(h1*Z),X);v2*ones(round(h2*Z),X);v3*ones(round(h3*Z),X)];



figure
imagesc(0:dh:dh*(X-1),0:dk:dk*(Z-1),v)
xlabel('X / m')
ylabel('Deepth / m')
title('�ٶ�ģ��')
h = colorbar;
set(get(h,'Title'),'string','v (m/s)');

a = questdlg('�Ƿ񱣴�ģ�ͣ�','�½�ģ��','Yes','No','Yes');
if (strcmp(a ,'Yes') )
    [filename,pathname] = uiputfile({'*.mat';'*.dat';'*.txt'}, '���Ϊ');
    str=[pathname filename];
    save(str,'v')
    msgbox('�ļ��ѱ���','OK','help')
else return;
end

% hObject    handle to Untitled_3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_4_Callback(hObject, eventdata, handles)
%����ģ��

global v
global file_path
[file_name,path_name] = uigetfile({'*.mat';'*.dat';'*.txt'},'���ļ�');
file_path = [path_name file_name];
v = cell2mat(struct2cell(load(file_path)));

global dh
global dk
answer=inputdlg({'dh(x������)','dk(z������)'},'������',[1 30;1 30],{'5','5'});
dh =(str2num(answer{1}));
dk = (str2num(answer{2}));

global X
global Z
[Z,X] = size(v);

if ( max(max(v))*dt/dh >= 1/sqrt(2) )
    errordlg( 'ERROR!!! �������ȶ�����������ǰ Vmax*dt/dh >= 1/sqrt(2)');
    return
end
if ( dh > min(min(v))/16/fm )
    warndlg('���С x �Ĳ����Լ���Ƶɢ' );
    return;
end

figure
imagesc(0:dh:dh*(X-1),0:dk:dk*(Z-1),v)
xlabel('X / m')
ylabel('Deepth / m')
title('�ٶ�ģ��')
h = colorbar;
set(get(h,'Title'),'string','v (m/s)');
% hObject    handle to Untitled_4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_8_Callback(hObject, eventdata, handles)
% ������ղ�
global N 
global v
global V
global X
global Z
answer=inputdlg('N(���ձ߽����)','������',[1 30],{'30'});
N =(str2num(answer{1}));

Vu=[];Vd=[];Vl=[];Vr=[];
for mmmm = 1:X
    Vu=[Vu v(1,mmmm)*ones(N,1)];
    Vd=[Vd v(Z,mmmm)*ones(N,1)];
end
for mmmm = 1:Z
    Vl = [Vl;v(mmmm,1)*ones(1,N)];
    Vr = [Vr;v(mmmm,X)*ones(1,N)];    %�ȼ���Vl=v(:,1)*ones(1,N)
end
corner1=v(1,1)*ones(N,N);
corner2=v(X,1)*ones(N,N);
corner3=v(Z,1)*ones(N,N);
corner4=v(Z,X)*ones(N,N);
V = [corner1 Vu corner2;
        Vl v Vr;
        corner3 Vd corner4];
    msgbox('���ղ��������','OK','help')
% hObject    handle to Untitled_8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
%����ͼ
ha=axes('units','normalized','pos',[0 0 1 1]);
uistack(ha,'down');
ii=imread('b1.jpg');
image(ii);
colormap gray
set(ha,'handlevisibility','off','visible','on');
% set( gca, 'XTick', [], 'YTick', [] ); 
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uipushtool1_ClickedCallback(hObject, eventdata, handles)
%ͼ�꣬�½�ģ��
%�½�ģ��
% dh=5;dk=5;dt=0.001;endt=0.21;   %dh,dk,dt�ֱ�Ϊx,z,t��������endtΪ��ֹʱ��
% fm=25;X=20;Z=160;              %�׿��Ӳ���Ƶ30Hz,�����С500*500
% N = 30;                               %   ���ղ��30
%  v1=3500;v2=2000;v3=3000;               %�ٶ�ģ��
% h1 = 4/16;
% h2 = 6/16;
% h3 = 6/16;                                              %ģ�ͺ��ռ��

% answer=inputdlg({'X(�����С)','Z(�����С)','N(���ձ߽����)','dh(x������)','dk(z������)','dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','v1(���ٶ�)','v2(���ٶ�)','v3(���ٶ�)','h1(��һ��ռ��)','h2(�ڶ���ռ��)','h3(������ռ��)'},'������',[1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30],{'40','160','30','5','5','0.001','25','3500','2000','3000','0.25','0.375','0.375'});
answer=inputdlg({'X(�����С)','Z(�����С)','dh(x������)','dk(z������)','v1(���ٶ�)','v2(���ٶ�)','v3(���ٶ�)','h1(��һ��ռ��)','h2(�ڶ���ռ��)','h3(������ռ��)'},'������',[1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30;1 30],{'40','160','5','5','3500','2000','3000','0.25','0.375','0.375'});
global v
global dh
global dk
global X 
global Z
% 'dt(s)','fm(�׿��Ӳ���Ƶ/Hz)','����ʱ��'
X =(str2num(answer{1}));
Z =(str2num(answer{2}));
dh= (str2num(answer{3}));
dk =(str2num(answer{4}));
v1 =(str2num(answer{5}));
v2=(str2num(answer{6}));
v3=(str2num(answer{7}));
h1=(str2num(answer{8}));
h2=(str2num(answer{9}));
h3=(str2num(answer{10}));



v=[v1*ones(round(h1*Z),X);v2*ones(round(h2*Z),X);v3*ones(round(h3*Z),X)];



figure
imagesc(0:dh:dh*(X-1),0:dk:dk*(Z-1),v)
xlabel('X / m')
ylabel('Deepth / m')
title('�ٶ�ģ��')
h = colorbar;
set(get(h,'Title'),'string','v (m/s)');

a = questdlg('�Ƿ񱣴�ģ�ͣ�','�½�ģ��','Yes','No','Yes');
if (strcmp(a ,'Yes') )
    [filename,pathname] = uiputfile({'*.mat';'*.dat';'*.txt'}, '���Ϊ');
    str=[pathname filename];
    save(str,'v')
    msgbox('�ļ��ѱ���','OK','help')
else return;
end

% hObject    handle to uipushtool1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function Untitled_17_Callback(hObject, eventdata, handles)
%����ϳɵ����¼
[file_name,path_name] = uigetfile({'*.mat';'*.dat';'*.txt'},'���ļ�');
file_path = [path_name file_name] ;
global record
if (strcmp(file_name(end-3:end) , '.mat'))
    b=whos('-file',file_path);
    c=size(b);
    if(sum(c) ~= 2)
        errordlg('��������Ӧֻ����һ������','����','modal');
        return
    end
end
record = cell2mat(struct2cell(load(file_path))) ;
msgbox('����ɹ�','OK','help');
% hObject    handle to Untitled_17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
