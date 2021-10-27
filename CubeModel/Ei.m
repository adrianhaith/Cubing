function snext = Ei(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    %snext(:,4) = s([7 8 1 2 3 4 5 6 9],4);
    snext([8 9 4],1) = s([8 9 4],2); % update R side
    snext([8 9 4],2) = s([8 9 4],3);
    snext([8 9 4],3) = s([8 9 4],4);
    snext([8 9 4],4) = s([8 9 4],1);