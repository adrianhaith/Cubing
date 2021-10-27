function snext = Lv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,4) = s([7 8 1 2 3 4 5 6 9],4);
    snext([6 7 8 1 2],1) = s([6 7 8 1 2],6); % update R side
    snext([6 7 8 1 2],5) = s([6 7 8 1 2],1);
    snext([2:6],3) = s([6 7 8 1 2],5);
    snext([6 7 8 1 2],6) = s([2:6],3);