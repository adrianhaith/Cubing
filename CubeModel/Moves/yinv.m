function snext = yinv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,1) = s(:,4); % L->F
    snext(:,2) = s(:,1); % F->R
    snext(:,3) = s(:,2); % R->B
    snext(:,4) = s(:,3); % B->L