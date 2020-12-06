
function [r] = cubic_interp(I, ratio)
    [h, w] = size(I);
    fh = (ratio * h);
    fw = (ratio * w);
    r = zeros(fh,fw);
    hs = (h/fh);
    ws = (w/fw);
    for i=1:fh
      y = (hs * i) + (0.5 * (1 - 1/ratio));
        for j=1:fw
           x = (ws * j) + (0.5 * (1 - 1/ratio));
      %// Any values out of acceptable range
          x(x < 1) = 1;
          x(x > h - 0.001) = h - 0.001;
          x1 = floor(x);
          x2 = x1 + 1;
          y(y < 1) = 1;
          y(y > w - 0.001) = w - 0.001;
          y1 = floor(y);
          y2 = y1 + 1;
      %// 4 Neighboring Pixels
          NP1 = I(y1,x1);
          NP2 = I(y1,x2);
          NP3 = I(y2,x1); 
          NP4 = I(y2,x2);
      %// 4 Pixels Weights
          PW1 = (y2-y)*(x2-x);
          PW2 = (y2-y)*(x-x1);
          PW3 = (x2-x)*(y-y1);
          PW4 = (y-y1)*(x-x1);
          r(i,j) = PW1 * NP1 + PW2 * NP2 + PW3 * NP3 + PW4 * NP4;
        end
    end
  end