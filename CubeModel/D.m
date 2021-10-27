function snext = D(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,6) = s([7 8 1 2 3 4 5 6 9],6);
    snext([7 6 5],2) = s([7 6 5],1); % update R side
    snext([7 6 5],4) = s([7 6 5],3);
    snext([7 6 5],1) = s([7 6 5],4);
    snext([7 6 5],3) = s([7 6 5],2);