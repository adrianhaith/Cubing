function snext = R(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,2) = s([7 8 1 2 3 4 5 6 9],2);
    snext([1 8 7],3) = s([5 4 3],5); % update R side
    snext([5 4 3],1) = s([5 4 3],6);
    snext([5 4 3],5) = s([5 4 3],1);
    snext([5 4 3],6) = s([1 8 7],3);