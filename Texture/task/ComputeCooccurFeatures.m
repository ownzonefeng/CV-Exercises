function cooccurFeats = ComputeCooccurFeatures(img,offset)

% we can see some effects by setting large offset; if we set too small
% offset, the textures will be indistinguishable (you can convince youself)
comat = graycomatrix(img,'Offset',offset);
comat = comat / sum(comat, 'all');
contst = 0;
dissimi = 0;
homo = 0;
[w, h] = size(comat);
for i = 1:w
    for j = 1:h
        contst = contst + comat(i, j) * (i - j);
        dissimi = dissimi + comat(i, j) * abs(i - j);
        homo = homo + comat(i, j) / (1 + (i - j)^2);
    end
end
ener = sum(comat .^ 2, 'all');
entro = -sum(comat .* log(comat + eps), 'all');
cooccurFeats = [contst, dissimi, homo, ener, entro];
end
            