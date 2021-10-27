function snext = Dv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,6) = s([7 8 1 2 3 4 5 6 9],6);
    snext([4:8],1) = s([4:8],2); % update R side
    snext([4:8],2) = s([4:8],3);
    snext([4:8],3) = s([4:8],4);
    snext([4:8],4) = s([4:8],1);