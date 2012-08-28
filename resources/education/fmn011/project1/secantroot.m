function [Xs, iter, e_quote, err] = secantroot(f, p0, p1, atol, rtol, Nmax)  
% Source: Wikipedia.
%
% secanttoot finds the root of Fun = 0 using the Secant method.  
% Input variables:  
% f      Function  
% p0 p1  Two points in the neighborhood of the root (on either side, or the  
%        same side of the root).  
% atol   Absolute error tolerance.  
% rtol   Residual error tolerance.  
% Nmax   Maximum number of iterations  
%
% Output variables:  
% Xs     Solution
% iter   Number of iterations that were run
% e_quote Error quotient e_(n)/e_(n-1)
% err    Error

e_quote(1) = 0;
err = 0;
for i = 1:Nmax
    iter=i;
    fp1 = feval(f,p1);
    pi = p1 - fp1*(p0-p1)/(feval(f,p0)-fp1);
    err = abs(pi - p1);
    
    if (i > 1) % Create and save error quotient
        e_quote(i-1)=err/errOld;
    end
        
    if (err < atol) || (abs(feval(f,pi)) < rtol)
        Xs = pi;
        break
    end
    errOld=err;
    p0 = p1;  
    p1 = pi;
end
end
