function [x, y, controlPoints] = splitupper(points, tsplit)
% Wrap the decasteljau algorithm for easier syntax and better readability
% and return Bezier curve of t>=tsplit
%
% Input:
% nbrPoints   Desired number of points of the resulting Bezier curve
% points      Control points used to create Bezier curve
% tsplit      Only return parts of the bezier curve generated with t>tsplit
%
% Output:
% x           Vector of x-coordinates of the innermost points used to calculate the Bézier curve
% y           Vector of y-coordinates of the innermost points used to calculate the Bézier curve
% controlPoints      Matrix of the innermost points used to calculate the Bézier curve

[~, controlPoints] = decasteljau(1-tsplit,flipud(points));

x=controlPoints(:,1);
y=controlPoints(:,2);

end