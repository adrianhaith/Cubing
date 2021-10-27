function snext = Bw(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,3) = s([7 8 1 2 3 4 5 6 9],3);
    snext([8 1 2 3 4],5) = s([2:6],2); % update R side
    snext([2:6],2) = s([4:8],6);
    snext([4:8],6) = s([6 7 8 1 2],4);
    snext([6 7 8 1 2],4) = s([8 1 2 3 4],5);