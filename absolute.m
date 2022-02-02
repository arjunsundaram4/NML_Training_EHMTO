function toChangeM = absolute(M,M2,r,c)
    diff=r*c;
    x=0;
    for item = 1:r;
        for item2 =1:c;
            if M(item,item2)==M2(item,item2)
                x=x+1;
            end
        end
    end
    toChangeM=((diff-x)*100)/(r*c);
    disp("Hello World"+x)
end
