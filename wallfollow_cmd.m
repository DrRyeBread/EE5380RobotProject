function [v, w] = wallfollow_cmd(z_meas, sense_angles, obs_thresh, direction)

%Find the distance to the closest obstacle
[obs_meas,iobs]=min(z_meas);

%Get corresponding angle to closest obstacle
obs_angle=sense_angles(iobs(1));
v=1;

w = direction*(5*atan2(sin(abs(obs_angle)-pi/2),cos(abs(obs_angle)-pi/2))+.5*(obs_meas-obs_thresh));