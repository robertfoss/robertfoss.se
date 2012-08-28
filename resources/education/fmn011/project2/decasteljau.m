function [point, points] = decasteljau(t0, points)
% Soruce: Slides, lecture #10
%
% Input:
% t0     Compute a point for t = t0, on the Bézier curve
% points The control points for the Bézier curve
%
% Output:
% point  Point on the current Bézier curve for the given t0
% prevPoint The innermost controlpoints used to calculate a point on the current Bézier curve

    dim = size(points);
    n = dim(1);
    dimen = 2;
    for j=1:n+1
        for i=1:n-j
            points(i:i,1:dimen) = points(i:i,1:dimen)*(1-t0)+ points(i+1:i+1,1:dimen)*t0;
        end
    end
    point = points(1:1,1:dimen);
end
