function val = feval(f, x)
%FEVAL   Evaluate a DELTAFUN.
%   FEVAL(F, X) evaluates the DELTAFUN F at the given points X. If the point of
%   evaluation has a non-trivial delta function, NaN is returned.

% Copyright 2013 by The University of Oxford and The Chebfun Developers. 
% See http://www.chebfun.org for Chebfun information.

% Trivial cases:
if ( isempty(x) )
    val = x;
    return
end

if ( isempty(f) )
    error( 'DELTAFUN:feval', 'can not evaluate an empty deltafun');
end

%%
% Evaluate the smooth part.
if ( isempty(f.funPart) )
    val = 0*x;
else
    val = feval(f.funPart, x);
end

% Mathematically, point values of distributions do not make sense:
if ( ~isempty(f.location) )
    pref = chebpref();
    proximityTol = pref.deltaPrefs.proximityTol;        
    % Make sure there are no trivial delta functions:
    f = simplify(f);
    deltaLoc = f.location;    
    for i = 1:length(deltaLoc)        
        if ( deltaLoc(i) == 0 ) 
            % Avoid divide by zero:
            idx = abs(x - deltaLoc(i)) < proximityTol;        
            val(idx) = NaN;                
        else
            % Check the relative distance from delta function locations:
            idx = abs(x - deltaLoc(i))./deltaLoc(i) < proximityTol;
            val(idx) = NaN;
        end        
    end     
end
