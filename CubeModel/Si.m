function snext = Si(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    %snext(:,4) = s([7 8 1 2 3 4 5 6 9],4);
    snext([8 9 4],5) = s([2 9 6],2); % update R side
    snext([6 9 2],4) = s([8 9 4],5);
    snext([4 9 8],6) = s([6 9 2],4);
    snext([2 9 6],2) = s([4 9 8],6);