function snext = U(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,5) = s([7 8 1 2 3 4 5 6 9],5);
    snext([3 2 1],2) = s([3 2 1],3); % update R side
    snext([3 2 1],4) = s([3 2 1],1);
    snext([3 2 1],1) = s([3 2 1],2);
    snext([3 2 1],3) = s([3 2 1],4);