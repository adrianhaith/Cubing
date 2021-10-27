function snext = Finv(s)
    
    snext = s;
    snext(:,1) = s([3 4 5 6 7 8 1 2 9],1);
    snext([7 6 5],5) = s([1 8 7],2);
    snext([3 2 1],6) = s([5 4 3],4);
    snext([5 4 3],4) = s([7 6 5],5);
    snext([1 8 7],2) = s([3 2 1],6);