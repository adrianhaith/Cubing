function snext = z(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,2) = s(:,5); % U->R
    snext(:,6) = s(:,2); % R->D
    snext(:,4) = s(:,6); % D->L
    snext(:,5) = s(:,4); % L->U