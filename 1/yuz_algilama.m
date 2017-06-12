% algýlama objesi yaratýlýr
faceDetector = vision.CascadeObjectDetector();

% Video frame' i okunur 
videoFileReader = vision.VideoFileReader('tilted_face.avi');
videoFrame      = step(videoFileReader);
bbox            = step(faceDetector, videoFrame);

% Yüzün etrafý çizilir.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
figure; imshow(videoFrame); title('Detected face');

