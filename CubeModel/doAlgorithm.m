function state = doAlgorithm(state, alg)
% perform a particular algorithm on the Rubik's cube
% For notation guide, refer to https://jperm.net/3x3/moves
% Specific naming conventions used here:
%           F = Clockwise Front Face Turn
%           Fi = Counterclockwise Front Face Turn
%           F2 = Double Front Face Turn
%           Fw = Clockwise Wide Front Face Turn (front + middle layers)
%           Fv = Counterclockwise Wide Front Face Turn (front + middle)
%


N = length(alg);
i = 1; % index of where in the string we are
Nmoves = 0; % number of moves
while i<=N
    switch(alg(i))
        case 'F'
            if(i<N)
                switch alg(i+1)
                    case '2'
                        state = F(F(state));
                        disp('F2')
                        i = i+2;
                        
                        
                    case 'i'
                        state = Finv(state);
                        disp('Finv')
                        i = i+2;
                        
                        
                    case 'w'
                        state = Fw(state);
                        disp('f')
                        i = i+2;
                        
                        
                    case 'v'
                        state = Fv(state);
                        disp('finv')
                        i = i+2;
                        
                        
                    otherwise
                        state = F(state);
                        disp('F');
                        i = i+1;
                        
                end
                
                
            else
                state = F(state);
                disp('F')
                i=i+1;
            end
    end
end
