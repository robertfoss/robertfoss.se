function [c, iter, e_quote, err] = bisection(f, a, b, tol, Nmax)
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
% err    Error

i = 1;
iter = 0;
cOld = abs(a-b);
e_quote(1) = 0;
err = 0;
while ((b-a)/2>tol) && (i<Nmax)
    iter = i;
    c = (a+b)/2; % midpoint
    err = abs(cOld-c);
    if (i > 1) % Create and save error quotient
        e_quote(i-1)=err/errOld;
    end
    
    if f(c)*f(a)>0
        a=c;  
    elseif f(c)*f(b)>0
        b=c;
    else
        cOld = c;
    end
    i=i+1;
    errOld = err;
    cOld = c;
end
end
