function [boxVar, posVect] = box(points)
% Creates a rectangle parallell with the x and y-axis around the convex
% hull of a set of points.
%
% Input:
% points      Points to surround with a rectangle
%
% Output:
% boxVar      The points of the smallest possible rectangle surrounding the convex hull of points
% posVect     Position vector of the rectangle

x = points(:,1);
y = points(:,2);
k = convhull(x,y);

xMin = min(x(k));
yMin = min(y(k));
xMax = max(x(k));
yMax = max(y(k));

boxVar(1:1,1:2) = [xMin yMin;];
boxVar(2:2,1:2) = [xMin yMax;];
boxVar(3:3,1:2) = [xMax yMax;];
boxVar(4:4,1:2) = [xMax yMin;];
boxVar(5:5,1:2) = [xMin yMin;];

posVect = [xMin yMin (xMax-xMin) (yMax-yMin)];

end