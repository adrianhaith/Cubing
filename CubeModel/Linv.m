function snext = Linv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,4) = s([3 4 5 6 7 8 1 2 9],4);
    snext([1 8 7],1) = s([1 8 7],6); % update R side
    snext([5 4 3],3) = s([1 8 7],5);
    snext([1 8 7],5) = s([1 8 7],1);
    snext([1 8 7],6) = s([5 4 3],3);