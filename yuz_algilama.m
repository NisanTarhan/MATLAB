% alg�lama objesi yarat�l�r
faceDetector = vision.CascadeObjectDetector();

% Video frame' i okunur 
videoFileReader = vision.VideoFileReader('tilted_face.avi');
videoFrame      = step(videoFileReader);
bbox            = step(faceDetector, videoFrame);

% Y�z�n etraf� �izilir.
videoFrame = insertShape(videoFrame, 'Rectangle', bbox);
figure; imshow(videoFrame); title('Detected face');

