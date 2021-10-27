function snext = zinv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,5) = s(:,2); % R->U
    snext(:,2) = s(:,6); % D->R
    snext(:,6) = s(:,4); % L->D
    snext(:,4) = s(:,5); % U->L