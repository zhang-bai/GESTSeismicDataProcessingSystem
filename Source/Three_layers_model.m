%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%二阶空间二阶时间声波方程
%地表吸收的三层均匀介质模型
%小仙出品，必属精品
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear
%% 设置初始变量
for q=1
dh=5;dk=5;dt=0.001;endt=0.3;   %dh,dk,dt分别为x,z,t的增量，endt为终止时间
fm=25;X=400;Z=400;              %雷克子波主频30Hz,网格大小500*500
Sx=X/2;Sz=Z/2;                    %震源位置
u=zeros(Z,X,round(endt/dt));           %初始化位移为0
DT=Dt(Sz,Sx,Z,X);               %初始化δ函数

 v1=3500;v2=2000;v3=3000;               %速度模型
v=[v1*ones(9*Z/16,X);v2*ones(1*Z/16,X);v3*ones(6*Z/16,X)];
end
for q=0
if ( max(max(v))*dt/dh >= 1/sqrt(2) )
    errordlg( 'ERROR!!! 不满足稳定性条件！当前 Vmax*dt/dh >= 1/sqrt(2)');
    return
end
if ( dh > min(min(v))/16/fm )
    warndlg('请减小 x 的步长以减少频散' );
    return;
end

end
%% 计算差分方程
for q=1
    for k=2:endt/dt
        for i=2:Z-1
            for j=2:X-1
                u(i,j,k+1)=(v(i,j)*dt/dh)^2*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k))+(2*dh^2-4*v(i,j)^2*dt^2)/dh^2*u(i,j,k)-u(i,j,k-1)+DT(i,j)*ricker(k*dt-dt,fm)           ;
            end
        end
    end
end
%% 合成地震记录
for i=0
    for k=1:round(endt/dt)
        record(k,:)=u(Sz,X*3/8:X*5/8,k);
    end   
end
%% 绘图
%% ***********************速度model**************************
figure(1)
for q=1
% figure(1)
imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,v(Z/2:3*Z/4,3*X/8:X*5/8))
h=colorbar;
set(get(h,'Title'),'string','v (m/s)');
colormap(jet)
end
%% ***********************波场快照***************************
figure(2)
   pic_num=1;
for k=1:round(endt/dt)
    if(mod(k,3) == 0)    
    figure(2)
        
        imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,u(Z/2:Z*3/4,3*X/8:X*5/8,k),[-0.1,0.1]);
        title('Three layers model snapshot')
%         h2=colorbar;
%         set(get(h2,'Title'),'string','u ');
         colormap(jet)
        drawnow
%        F=getframe(gcf);    
%     I=frame2im(F);
%     [I,map]=rgb2ind(I,256);
%     if pic_num == 1
%         imwrite(I,map,'Three_layers.gif','gif', 'Loopcount',inf,'DelayTime',0.00001);
%     else
%         imwrite(I,map,'Three_layers.gif','gif','WriteMode','append','DelayTime',0.00001);
%     end
%     pic_num = pic_num + 1;
     end
end
%% ***********************地震记录***************************
% figure(3)
% imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,record)
%    colormap(gray)
% colorbar
% xlabel('X-m')
% ylabel('t-ms')

%% *************************滤波*****************************
% figure(4)
% subplot(1,2,1)  %速度模型
% imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,v(Z/2:3*Z/4,3*X/8:X*5/8))
% hold on
% plot(dh*X/8,0,'pr','MarkerSize',10)
% text(dh*X/8+3,20,'震源')
% h=colorbar;
% set(get(h,'Title'),'string','v (m/s)');
%  colormap(jet)
% title('model')
% xlabel('X-m')
% ylabel('Z-m')
% 
% subplot(1,2,2)
% % record(1:endt/2/dt,:)=zeros(endt/2/dt,X/4+1);
% % for i=1:endt/dt
% %     for j=1:X/2+1
% %         if( record(i,j) < 0.01  )
% %             record(i,j)=0;
% %         end
% %     end
% % end
% imagesc(0:dh:dh*X/2,0:dt/endt,record)
% colorbar
% % colormap(gray)
% xlabel('X-m')
% ylabel('t-ms')
% title('record')