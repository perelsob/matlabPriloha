function [] = camera22_sub()
camera22_node = ros2node('camera22_node',27);
 fprintf('start  camera sub ...........  \n')

% domainId = 27;
% setenv("ROS_DOMAIN_ID",string(domainId))
% getenv("ROS_DOMAIN_ID")

 global counter;
 counter=int32(0);


%   chatterSub = ros2subscriber(camera22_node,"/image_raw","sensor_msgs/Image",@(msg) callback(msg));
  chatterSub = ros2subscriber(camera22_node,"/image_raw","sensor_msgs/Image",@(src,msg) callback(src,msg));


r = ros2rate(camera22_node,1);

reset(r)
while true
    waitfor(r);
end

% function callback(msg) % pre MATLAB
function callback(src,msg)        % pre deployment   
            counter = counter + 1;  % Increment the counter        
          
            fprintf('Iteration:%d Frame msg delivered  \n',counter)

end

end