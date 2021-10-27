function snext = L(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,4) = s([7 8 1 2 3 4 5 6 9],4);
    snext([1 8 7],1) = s([1 8 7],5); % update R side
    snext([5 4 3],3) = s([1 8 7],6);
    snext([1 8 7],5) = s([5 4 3],3);
    snext([1 8 7],6) = s([1 8 7],1);