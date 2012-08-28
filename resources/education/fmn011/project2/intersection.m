function [boolean] = intersection(points1, points2, maxIterations)
% Calculate if two curves intersect
%
% Input:
% points1     The control points of bezier curve 1
% points2     The control points of bezier curve 2
% maxIterations Maximum number of iterations to run this algorithm
%
% Output:
% boolean     Do the curves intersect. 0 = no

[~,posVect1] = box(points1);
[~,posVect2] = box(points2);
boolean = rectint(posVect1,posVect2);
if boolean == 0
    return
end
cp1{1} = points1;
cp2{1} = points2;
if 1 < maxIterations
    boolean = innerIntersect(cp1, cp2, 2, maxIterations);
end
end




function [boolean] = innerIntersect(cp1, cp2, currentIteration, maxIterations)
% Inner recurvsive function splitting the control points into sub control points and
% checking the rectangles around the sub control points for intersection
%
% Input:
% cp1         Subcontrolpoints for the first curve
% cp2         Subcontrolpoints for the second curve
% currentIteration Current iteration number
% maxIterations Maximum number of iterations to run this algorithm
%
% Output:
% boolean     Do the curves intersect. 0 = no

cp1dim = size(cp1);
nbrCp1 = cp1dim(2);
cp2dim = size(cp2);
nbrCp2 = cp2dim(2);
% Split curves into sub control points
newCp1{1} =[0 0];
for i=1:nbrCp1
    disp('Splitting curve 1')
    tempCp = cp1{i};
    [~, ~, tempCpL] = splitlower(tempCp,0.5);
    newCp1{(2*i -1)} = tempCpL;
    [~, ~, tempCpU] = splitupper(tempCp,0.5);
    newCp1{(2*i)} = tempCpU;
end
newCp2{1} =[0 0];
for i=1:nbrCp2
    disp('Splitting curve 2')
    tempCp = cp2{i};
    [~, ~, tempCpL] = splitlower(tempCp,0.5);
    newCp2{(2*i -1)} = tempCpL;
    [~, ~, tempCpU] = splitupper(tempCp,0.5);
    newCp2{(2*i)} = tempCpU;
end

% Look for intersection in rectangles of sub control points
nbrNewCp1 = nbrCp1*2;
nbrNewCp2 = nbrCp2*2;
boolean = 0;
for i=1:nbrNewCp1

    tempCp1 = newCp1{i};
    for j=1:nbrNewCp2
       disp(sprintf('Iter: %d; Checking subcurve %d against %d',currentIteration,i,j))
       tempCp2 = newCp2{j};
       [~,posVect1] = box(tempCp1);
       [~,posVect2] = box(tempCp2);
       boolean = rectint(posVect1,posVect2);
       if boolean ~= 0
           break
       end
    end
    if boolean ~= 0
       break
    end
end

if boolean == 0
    disp('innerIntersect: boolean == 0')
    return
end
if currentIteration < maxIterations
    disp(sprintf('innerIntersect: currentIteration < maxIterations  -- %d < %d', currentIteration,maxIterations))
    boolean = innerIntersect(newCp1, newCp2, currentIteration+1, maxIterations);
else
    disp(sprintf('innerIntersect: currentIteration >= maxIterations  -- %d >= %d', currentIteration,maxIterations))
    return
end



end