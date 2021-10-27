function snext = x(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,1) = s(:,6); % D->F
    snext(:,6) = s(:,3); % B->D
    snext(:,3) = s(:,5); % U->B
    snext(:,5) = s(:,1); % F->U