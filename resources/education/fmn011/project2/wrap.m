function [x, y] = wrap(nbrPoints, points)
% Wrap the decasteljau algorithm for easier syntax and better readability
%
% Input:
% nbrPoints   Desired number of points of the resulting Bezier curve
% points      Control points used to create Bezier curve
%
% Output:
% x           Vector of x-coordinates of the points on the Bezier curve
% y           Vector of y-coordinates of the points on the Bezier curve

n=nbrPoints;
t = linspace(0,1,n+1);
bezier = zeros(n+1,2);
for i = 1:n+1
    [point, ~] = decasteljau(t(i),points);
    bezier(i,1:2) = point;
end
x=bezier(:,1);
y=bezier(:,2);

end

