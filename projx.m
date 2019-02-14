function main()
img=imread('C:\Users\mohamed hussain\Desktop\color seg\images\flag7.jpg');
imshow(img);
%img
siz = size(img);
prompt = 'Enter k value: ';
k = input(prompt);
prompt='Enter no of population';
p=input(prompt);
prompt='Enter no of generation';
gen=input(prompt);
a = 0;
r = siz(1);
c = siz(2);
pop=popgen(k,p);
pop
ww=round((k+1)/2);
subplot(ww,ww,1),imshow(img);
for i=1:p
    add=mean(pop(i,:));
    fval(i)=fitness_calc(img,pop(i,:),add);
    
   %fvalue
end
pop1=de(pop,fval,p,img,gen);
%pop1
min_var=intmax;
for mm=1:p
    if(pop1(mm,(k+1))<min_var)
        min_var=pop1(mm,(k+1));
        index=mm;
    end
end
zxcv=cluster_gen(img,pop1(index,:),ww);
%pop1(1,1)

end








