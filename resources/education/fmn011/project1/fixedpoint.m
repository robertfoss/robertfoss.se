function [xc, iter, e_quote, err] = fixedpoint(g, x0, tol, Nmax)
% Source: Numerical Analysis by Timthy Sauer
%
% Input variables:
% g      Iteration function
% x0     Approximate solution
% tol    Tolerance
% Nmax   The maximum number of iterations
%
% Output variables:
% xc     Solution
% iter   Number of iterations that were run
% e_quote Error quotient e_(n)/e_(n-1)
% err    Error

x(1)=x0;
e_quote(1) = 0;
err = 0;
for i=1:Nmax
    k=i;
    x(i+1)=g(x(i));
    abs_error=abs(x(i)-x(i+1));
    rel_error=2*abs(x(i)-x(i+1))/(abs(x(i)+abs(x(i+1))));
    
    if (i > 1) % Create and save error quotient
        e_quote(i-1)=abs_error/abs_errorOld;
    end
    abs_errorOld = abs_error;
    if ((abs_error < tol) || (rel_error < tol))
        break;
    end
end
err = abs_error;
iter = k;
xc=x(k+1);

