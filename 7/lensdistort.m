%KAYNAK:
%http://www.mathworks.com/matlabcentral/fileexchange/37980-barrel-and-pincushion-lens-distortion-correction
function I2 = lensdistort(I, k, varargin)
%   Kullanýmý
%   --------
%       % Resim oku
%       I = imread('cameraman.tif');
%       % bozuk görüntü
%       I2 = lensdistort(I, 0.1);
%       % görüntülerin gösterilmesi
%       imshow(I), figure, imshow(I2)
%-------------------------------------------------------------------------
p = inputParser;
p.CaseSensitive = false;
addRequired(p,'I',@isnumeric);
addRequired(p,'k',@isnumeric);
defaultFtype = 4;
defaultBorder = 'crop';
defaultInterpolation = 'cubic';
defaultPadmethod = 'fill';
validBorder = {'fit','crop'};
validInterpolation = {'cubic','linear', 'nearest'};
validPadmethod = {'bound','circular', 'fill', 'replicate', 'symmetric'};
checkBorder = @(x) any(validatestring(x,validBorder));
checkInterpolation = @(x) any(validatestring(x,validInterpolation));
checkPadmethod = @(x) any(validatestring(x,validPadmethod));
addParamValue(p,'bordertype',defaultBorder,checkBorder);
addParamValue(p,'interpolation',defaultInterpolation,checkInterpolation);
addParamValue(p,'padmethod',defaultPadmethod,checkPadmethod);
addParamValue(p,'ftype',defaultFtype,@isnumeric);
parse(p,I,k,varargin{:});
%-------------------------------------------------------------------------
if ndims(I) == 3
     for i=1:3
        I2(:,:,i) = imdistcorrect(I(:,:,i),k);
     end   
elseif ismatrix(I)
    I2 = imdistcorrect(I,k);
else
    error('Unknown image dimensions')
end
%-------------------------------------------------------------------------
function I3 = imdistcorrect(I,k)
    [M N]=size(I);
    center = [round(N/2) round(M/2)];
    [xi,yi] = meshgrid(1:N,1:M);
    xt = xi(:) - center(1);
    yt = yi(:) - center(2);
    [theta,r] = cart2pol(xt,yt);
    R = sqrt(center(1)^2 + center(2)^2);
    r = r/R;
    s = distortfun(r,k,p.Results.ftype);
    s2 = s * R;
    brcor = bordercorrect(r,s,k, center, R);  
    s2 = s2 * brcor;           
    [ut,vt] = pol2cart(theta,s2);   
    u = reshape(ut,size(xi)) + center(1);
    v = reshape(vt,size(yi)) + center(2);
    tmap_B = cat(3,u,v);
    resamp = makeresampler(p.Results.interpolation, p.Results.padmethod);
    I3 = tformarray(I,[],resamp,[2 1],[1 2],[],tmap_B,255);
    end
%-------------------------------------------------------------------------
function x = bordercorrect(r,s,k,center, R)
        if k < 0
            if strcmp(p.Results.bordertype, 'fit')
               x = r(1)/s(1); 
            end
            if strcmp(p.Results.bordertype,'crop')    
               x = 1/(1 + k*(min(center)/R)^2);
            end
        elseif k > 0
            if strcmp(p.Results.bordertype, 'fit')
               x = 1/(1 + k*(min(center)/R)^2);
            end
            if strcmp(p.Results.bordertype, 'crop')    
               x = r(1)/s(1);
            end      
        end
    end
%-------------------------------------------------------------------------
function s = distortfun(r,k,fcnum)
        switch fcnum
        case(1)
            s = r.*(1./(1+k.*r));
        case(2)
            s = r.*(1./(1+k.*(r.^2)));
        case(3)
            s = r.*(1+k.*r);
        case(4)
            s = r.*(1+k.*(r.^2));
        end
    end
end