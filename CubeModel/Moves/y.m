function snext = y(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,4) = s(:,1); % F->L
    snext(:,1) = s(:,2); % R->F
    snext(:,2) = s(:,3); % B->R
    snext(:,3) = s(:,4); % L->B