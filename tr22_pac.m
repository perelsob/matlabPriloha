function [] = tr22_pac()
tr22_node = ros2node('tr22_node',27);
msg_sent = ros2message("builtin_interfaces/Time");
msg_delivered= ros2message("builtin_interfaces/Time");
myMsg = ros2message("builtin_interfaces/Time");
tableA = struct2table(myMsg, 'AsArray', true);

 global counter;
 counter=int32(0);

% time = ros2time();
% i = int32(0);
%  chatterSub = ros2subscriber(tr22_node,"/tr12_topic","builtin_interfaces/Time",@(msg) Tcallback(msg));
 chatterSub = ros2subscriber(tr22_node,"/tr12_topic","builtin_interfaces/Time",@(src,msg) Tcallback(src,msg));

chatterPub_sent11 = ros2publisher(tr22_node,"/sent11_time_topic","builtin_interfaces/Time");
chatterPub_delivered22 = ros2publisher(tr22_node,"/deliver22_time_topic","builtin_interfaces/Time");

r = ros2rate(tr22_node,1);


reset(r)
while true
     
% % 	time = r.TotalElapsedTime;
% %  	fprintf('Iteration: %d - Time Elapsed: %f\n',i,time)
%     time = ros2time(tr22_node,"now");
%     myMsg.sec=time.sec;
%     myMsg.nanosec=time.nanosec;
% %      fprintf('Iteration: %d - sec: %d  nanosec: %u\n',i,myMsg.Num.sec1,myMsg.Num.nanosec1)
%     send(chatterPub,myMsg);
            send(chatterPub_sent11,msg_sent);
            send(chatterPub_delivered22,msg_delivered);

    waitfor(r);
end

% function Tcallback(msg) % pre MATLAB
    function Tcallback(src,msg)        % pre deployment   
            counter = counter + 1;  % Increment the counter        
            time = ros2time(tr22_node,"now");
            msg_delivered.sec=time.sec;
            msg_delivered.nanosec=time.nanosec;
            msg_sent.sec=msg.sec;
            msg_sent.nanosec=msg.nanosec;
          
            fprintf('Iteration:%d SENT      sec: %d  nanosec: %u\n',counter,msg_sent.sec,msg_sent.nanosec)
            fprintf('Iteration:%d DELIVERED sec: %d  nanosec: %u\n',counter,msg_delivered.sec,msg_delivered.nanosec)



end

end