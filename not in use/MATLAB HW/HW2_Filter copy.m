function output = HW2_Filter(f,A,B)

% Template for the freq response of an ideal BPF.  
% Allows frequencies between A and B (and between -B and -A) to pass through.  
% Zeros out frequencies outside of this window.

% INPUTS:  vector of frequencies f = [f(1), f(2), ..., f(N)]
%          band pass filter cut off frequencies A and B, 
%          where 0 <= A < B <= 11025 / 2
% OUTPUT: vector of 1's and 0's of length N.
%   output(i) = 1 if A < f(i) < B, and is 0 otherwise.

% with these values of A and B, the filter acts as an all pass filter 
% for our noisy signals.  You will need to adjust the values of A and B
% to filter out the noise without filtering the signal.

shifted_f = fftshift(f);
output = zeros(1,length(f));
for n = 1:length(f)
    if (A < abs(shifted_f(n))) && (abs(shifted_f(n)) < B)
        output(n) = 1;
    else
        output(n) = 0;
    end
end
