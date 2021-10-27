function snext = B(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,3) = s([7 8 1 2 3 4 5 6 9],3);
    snext([1 8 7],4) = s([3 2 1],5); % update R side
    snext([5 4 3],2) = s([7 6 5],6);
    snext([3 2 1],5) = s([5 4 3],2);
    snext([7 6 5],6) = s([1 8 7],4);