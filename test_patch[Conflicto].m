p = pcbStack;
p.BoardThickness = 0.02;
d1 = dielectric('FR4');
d1.Thickness = 2e-3;
d2 = dielectric('Air');
d2.Thickness = 8e-3;
rl = antenna.Rectangle('Center',[0,0],'Length',L,'Width',L);
p.Layers = {rl,d1,rl,d1,rl};
p.FeedLocations = [0 0 3 5];
show(p)
