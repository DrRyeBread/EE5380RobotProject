function y = gpsMeasurementFcn(x,w)
Ts = 0.05;
v = sqrt( ((x(1)-w(1))/Ts)^2 + ((x(2)-w(2))/Ts)^2 );
w = (atan2(x(2),x(1))-atan2(w(2),w(1)))/Ts;
y=[v;w];



