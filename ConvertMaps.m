load mp.mat
map = robotics.BinaryOccupancyGrid(40,40,1);

for y=1:40
    for x=1:40
    setOccupancy(map, [x y], map2(y,x))
    end
end
show(map);