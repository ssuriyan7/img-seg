 function [ pop ] =popgen( k,n)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
fprintf('\nGenerating initial population\n');
a=0;
r=255;
x=a+(r-a).*rand(n,k);

pop=round(x);

end

