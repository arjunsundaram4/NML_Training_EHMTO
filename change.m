function toChangeM = change(M,r,c,distort)
    toChangeM = M;
    items = r * c;
    valstochange = items *distort / 2;
    
    for item = 1:valstochange
        randC = randi(c);
        randR = randi(r);
        if toChangeM(randR,randC) == 0
            toChangeM(randR,randC) = 1;
        elseif toChangeM(randR,randC) == 1
            toChangeM(randR,randC) = 0;
        end
    end
end
