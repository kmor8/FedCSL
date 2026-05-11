function order = graphtopoorder(G)
%GRAPHTOPOORDER Topological ordering of a DAG.
%   Reemplazo del graphtopoorder deprecado de Bioinformatics Toolbox.
%   G es matriz sparse donde G(i,j)=1 significa arista i->j.
%   Usa el algoritmo de Kahn (BFS sobre in-degree).

n = size(G, 1);

if n == 0
    order = [];
    return;
end

in_degree = full(sum(G, 1));
queue = find(in_degree == 0);
order = zeros(1, n);
idx = 1;

while ~isempty(queue)
    node = queue(1);
    queue = queue(2:end);
    order(idx) = node;
    idx = idx + 1;
    
    neighbors = find(G(node, :));
    for nb = neighbors
        in_degree(nb) = in_degree(nb) - 1;
        if in_degree(nb) == 0
            queue = [queue nb]; %#ok<AGROW>
        end
    end
end

if idx - 1 < n
    order = order(1:idx-1);
end

end