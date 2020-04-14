close all; clear all;
load map1.mat
reset(RandStream.getGlobalStream,sum(100*clock));
% global Ts start_pos goal_pos sense_angles min_obs_dist zmax goal_reached r b
% global behavior meas_cov xhat P Q laser_model gps_model enc_model 
%=====Variables=====
Ts = 0.05; %Sampling Time
start_pos = [5;5;0];
goal_pos = [20;30];
sense_angles = 0:(pi/20):(2*pi);
min_obs_dist = 0.5;
zmax = 10;
goal_reached = 0;

%Robot
r = 0.1; %Wheel radius
b = 0.5; %Wheel base
behavior = 0;

%Extended Kalman Filter Stuff
R = diag([0.1 0.1 0.5 0.5]);
xhat = [start_pos;0;0];
P = zeros(5,5);
Q = diag([0 0 0 0.5 0.5]);

%Lidar Model
laser_model.p_hit = 0.98;
laser_model.p_short = 0.005;
laser_model.p_max = 0.01;
laser_model.p_rand = 0.005;
laser_model.sigma_hit = 0.0025;
laser_model.lambda_short = 1;
laser_model.z_max = zmax;
laser_model.laser_angles=sense_angles;

%GPS Model
gps_model.var = 0.1;

%Encoder Model
enc_model.var = 0.5;
