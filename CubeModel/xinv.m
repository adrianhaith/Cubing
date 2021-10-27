function snext = xinv(s)
% simulate clockwise rotation of Front face of Rubik's cube

    snext = s;
    snext(:,6) = s(:,1); % F->D
    snext(:,3) = s(:,6); % D->B
    snext(:,5) = s(:,3); % B->U
    snext(:,1) = s(:,5); % U->F