function [P u]=f_path(W)
%
N=length(W);
U=W;
k=1;

while k<=N
    for m=1:N
        for n=1:N
            if U(m,k)+U(k,n)<U(m,n)
                U(m,n)=U(m,k)+U(k,n);
            end
        end
    end
    k=k+1;
end

u=U(1,N);       % The shortest path length from v1 to vn.

P=zeros(1,N);   % Vertex indices of the shortest path from v1 to vn.

k=1;
kk=N; 
P(N+1-k)=kk;    % Find the objective node from the last to the first.
while kk~=1
    for m=1:N
        if m~=kk
            tt=U(1,kk)-W(m,kk);
            if tt==U(1,m)
                k=k+1;
                P(N+1-k)=m;
                kk=m;
                break;
            end
        end
    end
end
P=P((N+1-k):N);

% Example 2.4
% W=[0,2,8,1,inf,inf,inf,inf;
% 2,0,6,inf,1,inf,inf,inf;
% 8,6,0,7,5,1,2,inf;
% 1,inf,7,0,inf,inf,9,inf;
% inf,1,5,inf,0,3,inf,8;
% inf,inf,1,inf,3,0,4,6;
% inf,inf,3,9,inf,4,0,3;
% inf,inf,inf,inf,8,6,3,0];

% Example 2.5
% W=[0,2,inf,8,inf,inf,inf,inf,inf,inf,inf;
%     inf,0,inf,6,1,inf,inf,inf,inf,inf,inf;
%     1,inf,0,inf,inf,inf,9,inf,inf,inf,inf;
%     inf,inf,7,0,inf,inf,inf,inf,inf,inf,inf;
%     inf,inf,inf,5,0,inf,inf,inf,1,inf,inf;
%     inf,inf,inf,1,3,0,4,inf,inf,inf,inf;
%     inf,inf,inf,2,inf,inf,0,inf,3,1,inf;
%     inf,inf,inf,inf,2,inf,inf,0,inf,inf,9;
%     inf,inf,inf,inf,inf,6,inf,7,0,inf,inf;
%     inf,inf,inf,inf,inf,inf,inf,inf,1,0,1;
%     inf,inf,inf,inf,inf,inf,inf,inf,2,inf,0]

% Example 2.6
% W=[0,23,inf,12,inf,6;
%     23,0,inf,inf,inf,inf;
%     inf,inf,0,8,inf,inf;
%     12,inf,8,0,inf,inf;
%     inf,inf,inf,inf,0,3;
%     6,inf,inf,inf,3,0]