function snext = Uinv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,5) = s([3 4 5 6 7 8 1 2 9],5);
    snext([3 2 1],2) = s([3 2 1],1); % update R side
    snext([3 2 1],4) = s([3 2 1],3);
    snext([3 2 1],1) = s([3 2 1],4);
    snext([3 2 1],3) = s([3 2 1],2);