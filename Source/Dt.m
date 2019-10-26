function a=Dt(x,z,xx,zz)
%x z，震源位置
%xx zz 网格大小
a=zeros(xx,zz);
a(x,z)=1;
end