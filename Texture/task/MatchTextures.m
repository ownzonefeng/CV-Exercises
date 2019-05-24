function label = MatchTextures(testFeatures, templateFeatures)
% NOTE: this function can be used to calculate the distance between test
% and template images using any of the three feature extraction methods
dist_mat = pdist2(testFeatures, templateFeatures);
[~, label] = min(dist_mat, [], 2);
end