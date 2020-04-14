function SLAMtest()
    load map1.mat
    load SLAMdata.mat
    %Pose Gotcha
    tpose = get(logsout{1}.Values);
    pose = [tpose.Data(:,1) tpose.Data(:,2) tpose.Data(:,3)];
    t = size(pose);
    sense_angles = 0:(pi/20):2*pi;
    len = length(sense_angles);
    %Lidar Gotcha
    temp = get(logsout{4}.Values);
    for i = 1:t
        scan = lidarScan(temp.Data(i,1:len),sense_angles);
        lidar{i} = scan;
    end
    
    SLAM = buildMap(lidar,pose,10,10);
    figure
    show(SLAM)
    hold on
    plot(pose(:,1),pose(:,2),'b.','MarkerSize',4); 
    trpose = get(logsout{2}.Values);
    rpose = [trpose.Data(:,1) trpose.Data(:,2) trpose.Data(:,3)];
%     plot(pose(:,1),pose(:,2),'r.','MarkerSize',4);
    figure
    show(map)
    hold on
    tpose = get(dsmout{1}.Values);
    pose = [tpose.Data(:,1) tpose.Data(:,2) tpose.Data(:,3)];
    plot(pose(:,1),pose(:,2),'b.','MarkerSize',4);
    plot(rpose(:,1),rpose(:,2),'r.','MarkerSize',4);
end

