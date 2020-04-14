function pose = extKalmanFilter(meas, sp)
Ts = 0.05;
persistent P xhat Q R
if isempty(P)

   xhat = [0;0;0;0;0];
   P = zeros(5,5);
   Q = diag([0 0 0 0 0]);
   R = 0.005/Ts;
end

F = [1 0 0 -Ts*sin(xhat(3)+Ts*xhat(5)/2) 0;
     0 1 0 Ts*cos(xhat(3)+Ts*xhat(5)/2) 0;
     0 0 1 0 Ts;
     0 0 0 1 0;
     0 0 0 0 1];
H = [0 0 0 1 1];
xhat = [(xhat(1) + xhat(4)*(-Ts)*sin(xhat(3)+Ts*xhat(5)/2));
        (xhat(2) + xhat(4)*(Ts)*cos(xhat(3)+Ts*xhat(5)/2));
        (xhat(3) + Ts*xhat(5));
        (sign(xhat(4))*sp(1));
        (sign(xhat(5))*sp(2))];
P = F*P*F' + Q;
% Calculate the Kalman gain
K = P*H'/(H*P*H' + R);
% Calculate the measurement residual
yhat = [xhat(4);xhat(5)];
resid = meas - yhat;
% Update the state and covariance estimates
xhat = xhat + K*resid;
P = (eye(size(K,1))-K*H)*P;

pose = [xhat(1);xhat(2);xhat(3)];

