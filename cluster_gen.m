function [ hh ] = cluster_gen( img,pop,ww)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
min=intmax;
%pop
n=length(pop)-1;
for z=1:n
    ccount(z)=0;
end
for r=1:n
  clusters(r,1)=pop(r);
    
end
fprintf('Forming clusters\n');
s=size(img);
red=img(:,:,1);
for i=1:s(1)
    for j=1:s(2)
        for k=1:n
            g=red(i,j);
            temp=abs(pop(k)-g);
            if(temp<min)
                min=temp;
                val=img(i,j);
                c=k;
                ij_cor(1)=i;
                ij_cor(2)=j;
            end
        end
        ccount(c)=ccount(c)+1;
        min=intmax;
         %Storing co-ordinates
         cluster_ind(ccount(c),:,c)=ij_cor;
         ij_cor=0;
       % clusters(c,ccount(c))= val;
        
    end
end
plot_no=2;
for i=1:n
    img=imread('C:\Users\mohamed hussain\Desktop\color seg\images\flag7.jpg');
    for ii=1:s(1)
    for jj=1:s(2)
        img(ii,jj,:)=[255 255 255];
    end
    end
    if(ccount(i)>0)
        for j=1:length(cluster_ind(:,:,i))
            vbc=cluster_ind(j,:,i);
            if(vbc~=0)
                img(vbc(1),vbc(2),:)=[0 0 0];
            end
        end
    end
   if(ccount(i)>0)
    subplot(ww,ww,plot_no),imshow(img);
    plot_no=plot_no+1;
   end
    
            
end

ccount
hh=pop;
end

