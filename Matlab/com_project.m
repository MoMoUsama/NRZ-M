clear all;
close all;
clc;


%--------------------------- encoding ----------------------------

input_bits  =[1 1 1 1 1 1 1 1];

    l = length(input_bits);
    output_bits = zeros(1, l+2);  %creat a vector which will contain the output

    output_bits(1) = 1;    % assume the bit before the input stream was 1




    for n = 2:l+1                %it starts from 2 beacause we assumed the first bit as 1
        if input_bits(n-1) == 0
            output_bits(n) = output_bits(n-1);
        else
            output_bits(n) = ~output_bits(n-1);
        end
    end

 %------------------ convert to polar -----------------------------------

for n=2:length(input_bits)+1
  if output_bits(n)==0
    output_bits(n)=-1;
  end
end

   % ----------------  graph of the encoded stream --------------------------

t1 = 1:length(output_bits);
subplot(3, 1, 2);         % Create a subplot for the decoding stream
stairs(t1, output_bits);     % Plot the decoding stream using stairs
xlabel('Time');
ylabel('Decoding Value');
title('encoding');

ylim([-2 2]);                     % scale the y-axis
xlim([1 l+1]);                    % scale the x-axis




%----------------------------- decoding ----------------------------

l2=length(output_bits);
decoding = zeros(1, l2);  %creat a vector which will contain the output
decoding(1)=1;    %assume the previous is 1

    for n = 2:l2               %it starts from 2 beacause we assumed the first bit as 1
        if output_bits(n-1) == output_bits(n)
            decoding(n) = 0;
        else
            decoding(n) = 1;
        end
    end



% ----------------  graph of the decoded bits --------------------------

t2 = 1:length(decoding); % Time vector for the output bit stream
subplot(3, 1, 3);  % Create a subplot for the output bit stream
stairs(t2, decoding);  % Plot the output bit stream using stairs

xlabel('Time');
ylabel('Output Bit');
title('decoding');

ylim([-2 2]);                     % scale the y-axis
xlim([1 l+1]);   % scale the x-axis

%-------------------- graph of the original stream ------------------------

t3 = 1:length(input_bits); % Time vector for the output bit stream
subplot(3, 1, 1);  % Create a subplot for the output bit stream
stairs(t3, input_bits);  % Plot the output bit stream using stairs

xlabel('Time');
ylabel('input_stream');
title('input');

ylim([-2 2]);                     % scale the y-axis
xlim([1 l]);                      % scale the x-axis



