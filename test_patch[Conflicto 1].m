p = pcbStack;
p.BoardThickness = 8e-3;
freqRange = (7022.7:78.03:8583.3) * 1e6;
d1 = dielectric('FR4');
d1.Thickness = 2e-3;
d2 = dielectric('Air');
d2.Thickness = 6e-3;
p.Layers = {p.Layers{1},d1,p.Layers{1},d2,p.Layers{2}};
p.FeedLocations = [0 0 3 5];
show(p)
figure(2);
s = sparameters(p, freqRange); 
rfplot(s) 