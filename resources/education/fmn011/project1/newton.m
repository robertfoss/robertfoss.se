function [answer, iter, e_quote, err] = newton(f, x0, tol, Nmax)
% Source: http://www.bukisa.com/articles/78586_newton-method-and-bisection-method-matlab-scripts
%
% Input variables:
% f      Function
% x0     Approximate solution
% tol    Tolerance
% Nmax   Maximum number of iterations
%
% Output variables:
% answer Solution
% iter   Number of iterations that were run
% e_quote Error quotient e_(n)/e_(n-1)
% err    Error

func = f;
Dfunc = inline(diff(sym(f)));
kCurrent = x0 - (func(x0)/Dfunc(x0));

e_quote(1) = 0;
err = 0;
for i = 1:Nmax
    iter = i;
    kNew = kCurrent - (func(kCurrent)/Dfunc(kCurrent));
    err = abs(kNew - kCurrent);
    
    if (i > 1) % Create and save error quotient
        e_quote(i-1)=err/errOld;
        errOld = err;
    end
    if kNew == kCurrent
        i = i-1;
        break
    end
    if err<tol
        break
    end
    kCurrent = kNew;
    errOld=err;
end

answer = kNew;
end

