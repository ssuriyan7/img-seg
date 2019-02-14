function [ fval ] = fitness_calc( img,a,add)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
min = intmax;
a=abs(a);
for z=1:length(a)
    count(z)=1;
end
%count
%for r=1:length(a);
 %   clusters(r,1)=a(r);
    
%end
%clusters
s=size(img);
%s(1)
%s(2)
sum=0;
d=length(a);
red=img(:,:,1);

fprintf('\nfitness for %s',(sprintf('%d ',a)));
for i=1:s(1)
    for j=1:s(2)
        for k=1:length(a)
            g=red(i,j);
           % a(k)
            temp=abs(a(k)-g);
            %temp
           % temp
            if(temp<min)
               % a
                min=temp;
                val=img(i,j);
                c=k;
                %c
               
            end
        end
       
        %sum
        count(c)=count(c)+1;
        %count(c)
        min=intmax;
        %clusters(c,count(c))= val;
        
    end
end
%count
va=0;
for i=1:length(a)
    va=va+(count(i)*((a(i)-add)^2));
end
va=va/length(a);
fprintf(' is:%d',va);
fval=va;
end

