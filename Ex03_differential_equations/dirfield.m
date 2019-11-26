function dirfield(f,xval,yval)
% dirfield(f, t1:dt:t2, y1:dy:y2)
%   
%   plot direction field for first order ODE y' = f(t,y)
%   using t-values from t1 to t2 with spacing of dt
%   using y-values from y1 to t2 with spacing of dy
%
%   f is an @ function, or an inline function,
%     or the name of an m-file with quotes.
%
% Example: y' = -y^2 + t
%{   
% Show direction field for t in [-1,3], y in [-2,2], use
% spacing of 0.25 for both t and y:
   f = @(t,y) -y^2+t
   figure, dirfield(f, -2:.25:6, -4:.25:4)
%}
[tm,ym]=meshgrid(xval,yval);
dt = xval(2) - xval(1); 
dy = yval(2) - yval(1);
fv = vectorize(f);
if isa(f,'function_handle')
  fv = eval(fv);
end
yp=feval(fv,tm,ym); 
s = 1./max(1/dt,abs(yp)./dy)*0.35;
h = ishold;
quiver(xval,yval,s,s.*yp,0,'.r'); hold on;
quiver(xval,yval,-s,-s.*yp,0,'.r');
if h
  hold on
else
  hold off
end
axis([xval(1)-dt/2,xval(end)+dt/2,yval(1)-dy/2,yval(end)+dy/2])