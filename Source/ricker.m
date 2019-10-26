function a = ricker(t,fm)
% t: 时间
% fm: 主频
% a: 幅值
a=(1-2*(pi*fm*t).^2).*exp(-(pi*fm*t).^2);
end
