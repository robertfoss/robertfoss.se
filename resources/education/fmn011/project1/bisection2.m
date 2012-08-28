function [c, iter, e_quote] = bisection2(f, a, b, tol, Nmax)
% Source: Slides from lecture #1
%
% Input variables:
% f      Function
% a,b    f(a), f(b) must have opposite signs
% tol    Tolerance
% Nmax   Maximum number of iterations  
%
% Output variables:
% c      Solution
% iter   Number of iterations that were run
% e_quote Error quotient e_(n)/e_(n-1)

i = 1;
iter = 0;
cOld = abs(a-b);
while ((b-a)/2>tol)||(i<Nmax)
    iter = i;
    i=i+1;
    c = (a+b)/2; % midpoint
    if f(c)*f(a)>0
        a=c;
    elseif f(c)*f(b)>0
        b=c;
    else
        err = abs(cOld-c);
        cOld = c;
        break
    end
end
end

