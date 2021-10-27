function snext = Uw(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,5) = s([7 8 1 2 3 4 5 6 9],5);
    snext([8 1 2 3 4],1) = s([8 1 2 3 4],2); % update R side
    snext([8 1 2 3 4],2) = s([8 1 2 3 4],3);
    snext([8 1 2 3 4],3) = s([8 1 2 3 4],4);
    snext([8 1 2 3 4],4) = s([8 1 2 3 4],1);