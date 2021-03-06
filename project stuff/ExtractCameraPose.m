function [Cset, Rset] = ExtractCameraPose(E)
%given the essential matrix return the four possible camera configurations.
[U,~,V]=svd(E);
W = [0 -1 0
    1 0 0
    0 0 1];

Cset = cell(4,1);
Rset = cell(4,1);

Cset{1} = U(:,3);
Cset{2} = -U(:,3);
Cset{3} = U(:,3);
Cset{4} = -U(:,3);

Rset{1} = U*W*V';
Rset{2} = U*W*V';
Rset{3} = U*W'*V';
Rset{4} = U*W'*V';

for i=1:4
    if det(Rset{i}) < 0
        Cset{i} = -Cset{i};
        Rset{i} = -Rset{i};
    end
end

end

