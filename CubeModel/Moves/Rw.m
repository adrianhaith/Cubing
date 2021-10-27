function snext = Rw(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,2) = s([7 8 1 2 3 4 5 6 9],2);
    snext([2:6],1) = s([2:6],6);
    snext([2:6],5) = s([2:6],1);
    snext([2:6],6) = s([6 7 8 1 2],3);
    snext([6 7 8 1 2],3) = s([2:6],5);