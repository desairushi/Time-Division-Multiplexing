clear;
close all;
clc;

%sin signal generation
d=0:.2:4    *pi;
signal1=2*sin(d);    
%triangular signal generation
len=length(signal1);
signal2=2*triang(len);
%square signal generation
x=0:.5:10*pi;
signal3=3*square(x);  
%sawtooth signal generation
v=0:.5:10*pi;
signals=sawtooth(v);
keyboard

%% 1. Signal Display

%Display of Sin signal in red colour
subplot(3,3,1);                          
plot(signal1,'red');
title('Sin Signal');
ylabel('Amp');
xlabel('T(sec)');

%Display of Triangular signal in green colour
subplot(3,3,2);
plot(signal2,'green');
title('Triangular');
ylabel('Amp');
xlabel('T(sec)');

%Display of square signal in blue colour
subplot(3,3,3);
plot(signal3,'blue');
title('Square');
ylabel('Amp');
xlabel('T(sec)');

%Display of sawtooth signal in magenta colour
subplot(3,3,7);                          
plot(signals,'magenta');
title('Sawtooth');
ylabel('Amp');
xlabel('T(sec)');

%Display of sampled sin signal in red
subplot(3,3,4);
stem(signal1,'red');
title('Sampled Sin');
ylabel('Amp');
xlabel('T(sec)');

%Display of sampled triangular signal in green colour
subplot(3,3,5);
stem(signal2,'green');
title('Sampled Triangular');
ylabel('Amp');
xlabel('T(sec)');

%Display of sampled square signal in blue colour
subplot(3,3,6);
stem(signal3,'blue');
title('Sampled Square');
ylabel('Amp');
xlabel('T(sec)');

%Display of sampled sawtooth signal in red colour
subplot(3,3,8);
stem(signals,'magenta');
title('Sampled sawtooth');
ylabel('Amp');
xlabel('T(sec)');
keyboard
%% 

%% 2.Generation of Multiplexed signal and Display

%4*64 matrix generation from different signals
len1=length(signals);
for i=1:len1
    s(1,i)=signal1(i); 
    s(2,i)=signal2(i);
    s(3,i)=signal3(i);
    s(4,i)=signals(i);
end

%1*252 array generation
multiplexed=reshape(s,1,4*len1);           

% Display of TDM Signal
figure 
stem(multiplexed);
title('Time Division Multiplexer');
ylabel('Amp');
xlabel('T(sec)');
keyboard
%% 

%% 3.Demultiplexing and Display
%same logic to generate 4*64 matrix from 1*252 array
demuxltiplexer=reshape(multiplexed,4,len1);
for i=1:len1
  signal4(i)=demuxltiplexer(1,i);
  signal5(i)=demuxltiplexer(2,i);
  signal6(i)=demuxltiplexer(3,i);
  signal7(i)=demuxltiplexer(4,i);
end
 
 figure
 %Demultiplexed sin signal
 subplot(4,1,1)
 plot(signal4,'red');
 title('Demultiplexed Sin Signal');
 ylabel('Amp');
 xlabel('T(sec)');
 
 %Demultiplexed Triangular signal
 subplot(4,1,2)
 plot(signal5,'green');
 title('Demultiplexed Triangular Signal');
 ylabel('Amp');
 xlabel('T(sec)');

 %Demultiplexed square signal
 subplot(4,1,3)
 plot(signal6,'blue');
 title('Demultiplexed Square Signal');
 ylabel('Amp');
 xlabel('T(sec)');

 %Demultiplexed sawtooth signal
 subplot(4,1,4)
 plot(signal7,'magenta');
 title('Demultiplexed Sawtooth Signal');
 ylabel('Amp');
 xlabel('T(sec)');

%%
% Limitations:	Because the logic utilised within the code does not account  for real-world conditions such as noise on the communication channel, filters cannot be used.
% 	Buffer is not included, and Arrays and Matrix are not recommended for signals with high amplitude and frequency because the 'for' loop will take an eternity to complete.
% 	Because arrays and matrices are included, the easiest approach to deal with them is to utilise the reshape() function, which has a limited set of applications and does not operate with buffer, resulting in no ‘SCAN’ function.

% Reference
% Debaraj ,R (2022 MATLAB Central File Exchange .Available at:https://www.mathworks.com/matlabcentral/fileexchange/28422-time-division-multiplexing-tdm,(Accessed:April 24,2022).
