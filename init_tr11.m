function [] = tr11_pac()
tr11_node = ros2node('tr11_node',27);
myMsg = ros2message("builtin_interfaces/Time");
fprintf('start.................')
call_TESFA_InitBoard();


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



function  call_TESFA_InitBoard()  
%#codegen
% Check the target. Do not use coder.ceval if callmyabsval is
% executing in MATLAB
if coder.target('MATLAB')
  % Executing in MATLAB, call function myabsval

else
    % Executing in generated code, call C function foo 

     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\TESFA_Support.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\crc.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\crc_tbl_gen.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tte_spi.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\test_C.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tt_ms_es_config_load.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tt_ms_fail_safe.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tt_ms_debug.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tt_ms_wait.c');
     coder.updateBuildInfo('addSourceFiles','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\src\tt_ms_es_barrier.c');
     coder.updateBuildInfo('addSourceFiles','C:\ProgramData\MATLAB\SupportPackages\R2022b\toolbox\realtime\targets\raspi\src\periphs\MW_SPI.c');

    coder.updateBuildInfo('addIncludePaths','C:\ProgramData\MATLAB\SupportPackages\R2022b\toolbox\realtime\targets\raspi\unifiedserver');
    coder.updateBuildInfo('addIncludePaths','C:\Users\peter\Desktop\diplomovka\Raspi_TTE_Test\include');

    coder.updateBuildInfo('addIncludePaths','C:\ProgramData\MATLAB\SupportPackages\R2022b\toolbox\realtime\targets\raspi\include');
    coder.updateBuildInfo('addIncludePaths','C:\ProgramData\MATLAB\SupportPackages\R2022b\toolbox\target\shared\svd\include'); 

    coder.updateBuildInfo('addIncludePaths','C:\ProgramData\MATLAB\SupportPackages\R2022b\toolbox\slrealtime\target\supportpackage\qnx710\target\qnx7\usr\include\netdrvr'); 
    
    coder.cinclude('TESFA_Support.h');
    coder.ceval('TESFA_InitBoard');


  
end
end

end
