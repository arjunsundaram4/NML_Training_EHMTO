function toChangeM = threshold(M,r,c)
    toChangeM = M; 
    for item = 1:r;
        for item2 =1:c;
            if toChangeM(item,item2) <=0
                toChangeM(item,item2) = -1;
            elseif toChangeM(item,item2)>0
                toChangeM(item,item2) = 1;
        end
        end
    end
end
