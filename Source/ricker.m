function a = ricker(t,fm)
% t: ʱ��
% fm: ��Ƶ
% a: ��ֵ
a=(1-2*(pi*fm*t).^2).*exp(-(pi*fm*t).^2);
end
