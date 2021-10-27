function snext = M(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    %snext(:,4) = s([7 8 1 2 3 4 5 6 9],4);
    snext([2 9 6],1) = s([2 9 6],5); % update R side
    snext([2 9 6],5) = s([6 9 2],3);
    snext([6 9 2],3) = s([2 9 6],6);
    snext([2 9 6],6) = s([2 9 6],1);