
% Create MATLAB Coder Configuration Object
cfg = coder.config('exe');
% Configure Hardware Properties
cfg.Hardware = coder.hardware('Robot Operating System 2 (ROS 2)');
cfg.Hardware.DeployTo = 'Remote Device';
%  cfg.Hardware.BuildAction = 'Build and Run';
 cfg.Hardware.BuildAction = 'Build and Load';
cfg.Hardware.RemoteDeviceAddress = '192.168.137.128';
cfg.Hardware.RemoteDeviceUsername = 'piS';
cfg.Hardware.RemoteDevicePassword = 'root';
cfg.Hardware.ROS2Workspace = '~/ros2_ws';
cfg.BuildConfiguration = 'Specify';
cfg.CustomToolchainOptions{8} = '"-lwiringPi"'; % Add Link Libraries
cfg.Hardware.ROS2Folder = '/opt/ros/humble';

 device = ros2device('192.168.137.128','piS','root')
 codegen init_tr11 -args {} -config cfg 
%  codegen callfoo -args {} -config cfg 
%     codegen camera22_sub -args {} -config cfg
% device = ros2device('192.168.137.122','peter','Snehsneh12')
%  codegen package2 -args {} -config cfg
% codegen tr11_pac -args {} -config cfg
% codegen tr22_pac -args {} -config cfg
% stopNode(device,'robotROS2FeedbackControlCodegen')
% stopNode(device,'node_T')
% stopNode(device,'package2')
% runNode(device,'package2')
% 
%  runNode(device,'tr11_pac')
% 
%  domainId = 27;
% setenv("ROS_DOMAIN_ID",string(domainId))
% getenv("ROS_DOMAIN_ID")
 
