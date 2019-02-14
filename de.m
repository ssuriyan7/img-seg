function [ de_pop ] = de(pop,fval,p,img,gen )
%fval
fval1=fval;
for v=1:gen
fprintf('\ngen:%d',v)
f=0.46;
cross_prob=0.67;
for i=1:p
    %mutation
    init_pop=pop(i,:);
    a=1;
    r=p;
    if(p<=3)
     rand1=round(a+(r-a).*rand(1));   
     rand2=round(a+(r-a).*rand(1));
     rand3=round(a+(r-a).*rand(1));
    
    end
    if (p>3)
     rand1=round(a+(r-a).*rand(1));
    while (rand1==i)
         rand1=round(a+(r-a).*rand(1));
    end
    rand2=round(a+(r-a).*rand(1));
    while ((rand2==rand1)&&(rand2==i))
     rand2=round(a+(r-a).*rand(1));   
    end
    rand3=round(a+(r-a).*rand(1));
    while ((rand3==rand1)&&(rand3==rand2)&&(rand3==i))
     rand3=round(a+(r-a).*rand(1));   
    end
    end
    pop1=pop(rand1,:);
    %pop1 
    pop2=pop(rand2,:);
   % pop2 
    pop3=pop(rand3,:);
   % pop3
    mut_vect=abs(pop1+round(f*(pop2-pop3)));
    
    %crossover 
     flag1=0;
    for rv=1:length(init_pop)
    cross_rand= 0.1+(0.9-0.1).*rand(1);
    if(cross_rand>cross_prob )    
            temp=mut_vect(rv);
            mut_vect(rv)=init_pop(rv);
            init_pop(rv)=temp;
            flag1=1;
     end
    end
    if(flag1==0)
        rv=1+(length(init_pop)-1).*rand(1);
        rv=round(rv);
            temp=mut_vect(rv);
            mut_vect(rv)=init_pop(rv);
            init_pop(rv)=temp;
            
         
    end   
    %mut_vect
     add=mean(mut_vect);
    mut_vec_var=fitness_calc(img,mut_vect,add);
    %selection
    if(fval(i)>mut_vec_var)
        fval(i)=mut_vec_var;
        pop(i,:)=mut_vect;
    end
end
%fval
fval1(v,:)=fval;
end
%pop
%fval1
fval_trans=transpose(fval1);
min_fval=min(fval_trans);
min_fval
%plot(min_fval,'-x');
xx=length(pop(1,:))+1;
for mm=1:p
   pop(mm,xx)=fval(mm); 
end
de_pop=pop;
end

