function A = fedcsl_orient_local(dataset, cpm)
% Wrapper para Step 3 de FedCSL: hill-climbing local restringido al skeleton.
% Llamado desde Python via MATLAB Engine.
%
% Input:
%   dataset : matriz de datos local del cliente (n_samples x n_vars)
%   cpm     : candidate parent matrix = tril(skeleton), matriz sparse
%
% Output:
%   A : matriz de adyacencia orientada (n_vars x n_vars)

LocalScorer = bdeulocalscorer(dataset, max(dataset));
HillClimber = hillclimber(LocalScorer, 'CandidateParentMatrix', cpm);
A = HillClimber.learnstructure();

end
