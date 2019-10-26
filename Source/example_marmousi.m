%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%emample of marmousi model
%dh=10;dk=10;dt=0.001;endt=1.2;N=100;  
%dh,dk,dt分别为x,z,t的增量，endt为终止时间
%X=384+N*2;Z=122+N*2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
load u.mat
load v.mat
load record.mat

%% wave fild snapshot
% dt=0.001*20 = 0.2s
% PCL = 100 layers
% frequency of riker 15 Hz
figure
for k = 1:60
    imagesc(0:dh:dh*(X-2*N),0:dk:dk*(Z-2*N),uu(:,:,k),[-1,1])
     title(['波场快照 第 ',num2str(k*0.02),' s'])
                hold on
                 contour(a,b,md,'k')
                 hold on
                 plot(dh*(X-2*N)/2,20,'pr','MarkerSize',13)
                 text(dh*(X-2*N)/2+35,80,'震源','FontSize',15)
                h2=colorbar;
                set(get(h2,'Title'),'string','u ');
                colormap(jet)
               pause(0.01)
end
%% ***********************速度model**************************
% figure
% for q=1
% % figure(1)
% imagesc(0:dh:dh*(X-2*N),0:dk:dk*(Z-2*N),v(N+1:Z-N,N+1:X-N))
% h=colorbar;
% set(get(h,'Title'),'string','v (m/s)');
% colormap(jet)
% end
%生成模型图
%插值数据大小122*384，网格间距24m*24m
global vv
figure
N=100;X=384+N*2;Z=122+N*2;
imagesc(0:24:24*121,0:24:24*384,vv(N+1:Z-N,N+1:X-N))
ylabel('深度 / m')
xlabel('X / m')
h=colorbar;
set(get(h,'Title'),'string','v (m/s)');
colormap(jet)
%% ***********************地震记录***************************
figure
imagesc(0:dh:dh*(X-2*N),0:round(endt/dt),record)
   colormap(gray)
colorbar
xlabel('X-m')
ylabel('t-ms')