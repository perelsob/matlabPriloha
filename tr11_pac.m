function [] = tr11_pac()
tr11_node = ros2node('tr11_node',27);
myMsg = ros2message("builtin_interfaces/Time");
fprintf('start.................')





% time = ros2time();

% chatterSub = ros2subscriber(tr1_node,"/my_topic", "time_mes/Num",@(src,msg) Tcallback(src,msg));
chatterPub = ros2publisher(tr11_node,"/tr12_topic","builtin_interfaces/Time");

r = ros2rate(tr11_node,1);
i = int32(0);

reset(r)
while true
    i=i+1;
% 	time = r.TotalElapsedTime;
%  	fprintf('Iteration: %d - Time Elapsed: %f\n',i,time)
    time = ros2time(tr11_node,"now");
    myMsg.sec=time.sec;
    myMsg.nanosec=time.nanosec;
%      fprintf('Iteration: %d - sec: %d  nanosec: %u\n',i,myMsg.Num.sec1,myMsg.Num.nanosec1)
    send(chatterPub,myMsg);

    waitfor(r);
end

% function Tcallback(src,msg)
%     fprintf('MESSAGE RECEIVED!');
%     fprintf('%u\n',msg.stamp.nanosec);

% end
end