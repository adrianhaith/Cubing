% Rubik's cube representation
% represent cube state as a matrix: Nsides (6) x Nfaces (8)
% convention:   faces 1-6 = FRBLUD
%               edges: 
%                 ---------
%                 | 1 2 3 |
%                 | 8 U 4 |
%                 | 7 6 5 |
%         ---------------------------------    
%         | 1 2 3 | 1 2 3 | 1 2 3 | 1 2 3 |
%         | 8 L 4 | 8 F 4 | 8 R 4 | 8 B 4 |
%         | 7 6 5 | 7 6 5 | 7 6 5 | 7 6 5 |
%         ---------------------------------
%                 | 1 2 3 |
%                 | 8 D 4 |
%                 | 7 6 5 |
%                 ---------
% 
% Face color is the 9th element of the vector
% 
clear all
addpath Moves


o = ones(9,1);
%Nstates = 48;

%init_state = [1*o; 2*o; 3*o; 4*o; 5*o; 6*o];
init_state = [1*o 2*o 3*o 4*o 5*o 6*o];
% facies model
%for = 1:6
%    init_state(:,:,i) = i*o;
%end

% define moves
%I = eye(Nstates);

% basic permutation for rotating a face:
Rot = [0 0 1 0 0 0 0 0 0;
       0 0 0 1 0 0 0 0 0;
       0 0 0 0 1 0 0 0 0;
       0 0 0 0 0 1 0 0 0;
       0 0 0 0 0 0 1 0 0;
       0 0 0 0 0 0 0 1 0;
       1 0 0 0 0 0 0 0 0;
       0 1 0 0 0 0 0 0 0;
       0 0 0 0 0 0 0 0 1];
 
Rot_inv = inv(Rot);

%%
% implement an algorithm
alg = 'FwF';
state = init_state;
state = doAlgorithm(state,alg);

