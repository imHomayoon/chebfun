function r = deflate(N, r0, p, alp)
%CHEBOP    Apply deflation to seek multiple solutions to BVPs
%
%   R = DEFLATE(N, R0, P, ALP)
if (isa(r0,'chebfun'))
    r0 = mat2cell(r0);
end

if (nargin(N.op) < 2 )
    error('must pass x and u to N.op');
end

N.op = @(x,u) deflationFun(N.op(x,u), u, r0, p, alp);

r = N\0;

end