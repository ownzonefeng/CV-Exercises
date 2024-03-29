function vect = ComputeFeatures(img,bank)
img = im2double(img);
vect = zeros(1, 2 * length(bank));
for i = 1:length(bank)
    current_filter = real(bank(i).SpatialKernel);
    filtered = imfilter(img, current_filter);
    feature_mean = mean(filtered, 'all');
    feature_std = var(filtered, 0, 'all');
    ind = (i - 1) * 2 + 1;
    vect(ind:ind+1) = [feature_mean, feature_std];
end
end
        
    