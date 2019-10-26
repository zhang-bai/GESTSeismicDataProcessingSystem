%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%���׿ռ����ʱ����������
%�ر����յ�������Ƚ���ģ��
%С�ɳ�Ʒ��������Ʒ
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc,clear
%% ���ó�ʼ����
for q=1
dh=5;dk=5;dt=0.001;endt=0.3;   %dh,dk,dt�ֱ�Ϊx,z,t��������endtΪ��ֹʱ��
fm=25;X=400;Z=400;              %�׿��Ӳ���Ƶ30Hz,�����С500*500
Sx=X/2;Sz=Z/2;                    %��Դλ��
u=zeros(Z,X,round(endt/dt));           %��ʼ��λ��Ϊ0
DT=Dt(Sz,Sx,Z,X);               %��ʼ���ĺ���

 v1=3500;v2=2000;v3=3000;               %�ٶ�ģ��
v=[v1*ones(9*Z/16,X);v2*ones(1*Z/16,X);v3*ones(6*Z/16,X)];
end
for q=0
if ( max(max(v))*dt/dh >= 1/sqrt(2) )
    errordlg( 'ERROR!!! �������ȶ�����������ǰ Vmax*dt/dh >= 1/sqrt(2)');
    return
end
if ( dh > min(min(v))/16/fm )
    warndlg('���С x �Ĳ����Լ���Ƶɢ' );
    return;
end

end
%% �����ַ���
for q=1
    for k=2:endt/dt
        for i=2:Z-1
            for j=2:X-1
                u(i,j,k+1)=(v(i,j)*dt/dh)^2*(u(i+1,j,k)+u(i-1,j,k)+u(i,j+1,k)+u(i,j-1,k))+(2*dh^2-4*v(i,j)^2*dt^2)/dh^2*u(i,j,k)-u(i,j,k-1)+DT(i,j)*ricker(k*dt-dt,fm)           ;
            end
        end
    end
end
%% �ϳɵ����¼
for i=0
    for k=1:round(endt/dt)
        record(k,:)=u(Sz,X*3/8:X*5/8,k);
    end   
end
%% ��ͼ
%% ***********************�ٶ�model**************************
figure(1)
for q=1
% figure(1)
imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,v(Z/2:3*Z/4,3*X/8:X*5/8))
h=colorbar;
set(get(h,'Title'),'string','v (m/s)');
colormap(jet)
end
%% ***********************��������***************************
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
%% ***********************�����¼***************************
% figure(3)
% imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,record)
%    colormap(gray)
% colorbar
% xlabel('X-m')
% ylabel('t-ms')

%% *************************�˲�*****************************
% figure(4)
% subplot(1,2,1)  %�ٶ�ģ��
% imagesc(0:dh:dh*X/4,0:dk:dk*Z/4,v(Z/2:3*Z/4,3*X/8:X*5/8))
% hold on
% plot(dh*X/8,0,'pr','MarkerSize',10)
% text(dh*X/8+3,20,'��Դ')
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