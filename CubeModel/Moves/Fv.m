function snext = Fv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,1) = s([7 8 1 2 3 4 5 6 9],1);
    snext([4:8],5) = s([6 7 8 1 2],2);
    snext([6 7 8 1 2],2) = s([8 1 2 3 4],6);
    snext([8 1 2 3 4],6) = s([2:6],4);
    snext([2:6],4) = s([4:8],5);