function toChangeM = change(M,r,c,distort)
    toChangeM = M;
    items = r * c;
    valstochange = (distort*items)/100;
    
    for item = 1:valstochange
        randC = randi(c);
        randR = randi(r);
        if toChangeM(randR,randC) == -1
            toChangeM(randR,randC) = 1;
        elseif toChangeM(randR,randC) == 1
            toChangeM(randR,randC) = -1;
        end
    end
    disp(valstochange)
end
