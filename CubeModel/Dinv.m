function snext = Dinv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,6) = s([3 4 5 6 7 8 1 2 9],6);
    snext([7 6 5],2) = s([7 6 5],3); % update R side
    snext([7 6 5],4) = s([7 6 5],1);
    snext([7 6 5],1) = s([7 6 5],2);
    snext([7 6 5],3) = s([7 6 5],4);