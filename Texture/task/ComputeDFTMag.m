function imageFeatures = ComputeDFTMag(img)
img = im2double(img);
imageFeatures = abs(fft2(img));
imageFeatures = reshape(imageFeatures', 1, []);
end