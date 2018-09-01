function pass = test_HelmholtzDecomposition( pref ) 

% Grab some preferences
if ( nargin == 0 )
    pref = chebfunpref();
end
tol = 1e2*pref.techPrefs.chebfuneps;

%% Two-component form

S = [51,51,51];

% Example 1 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(1) = norm(v-w)<tol;

% Example 2 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(2) = norm(v-w)<tol;

S = [51,51,51];

% Example 3 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(3) = norm(v-w)<tol;

% Example 4 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(4) = norm(v-w)<tol;

S = [53,53,53];

% Example 5 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(5) = norm(v-w)<tol;

% Example 6 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi] = HelmholtzDecomposition(v);
w = grad(f)+ballfunv.PT2ballfunv(Ppsi,Tpsi);
pass(6) = norm(v-w)<tol;

%% Three-component form

S = [51,51,51];

% Example 7 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(7) = norm(v-w)<tol;

% Example 8 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(8) = norm(v-w)<tol;

S = [51,51,51];

% Example 9 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(9) = norm(v-w)<tol;

% Example 10 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(10) = norm(v-w)<tol;

S = [53,53,53];

% Example 11 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(11) = norm(v-w)<tol;

% Example 12 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(12) = norm(v-w)<tol;

S = [52,54,56];

% Example 13 :
vx = ballfun(@(x,y,z)cos(x.*y),'cart',S);
vy = ballfun(@(x,y,z)sin(x.*z),'cart',S);
vz = ballfun(@(x,y,z)cos(y.*z),'cart',S);
v = ballfunv(vx,vy,vz);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(13) = norm(v-w)<tol;

% Example 14 :
f = ballfun(@(x,y,z)cos(y.*z),'cart',S);
P = ballfun(@(x,y,z)cos(x.*y),'cart',S);
T = ballfun(@(x,y,z)sin(x.*z),'cart',S);
v = grad(f) + ballfunv.PT2ballfunv(P,T);
[f,Ppsi,Tpsi,phi] = HelmholtzDecomposition(v);
w = grad(f)+curl(ballfunv.PT2ballfunv(Ppsi,Tpsi))+grad(phi); 
pass(14) = norm(v-w)<tol;

if (nargout > 0)
    pass = all(pass(:));
end
end