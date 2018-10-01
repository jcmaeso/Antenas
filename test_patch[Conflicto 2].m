p = pcbStack;
rl = antenna.Rectangle('Center',[0,0],'Length',L,'Width',W);
rm = antenna.Rectangle('Center',[0,0],'Length',L+6*h,'Width',W+6*h);
p.BoardThickness = 0.001588*2;
p.BoardShape = rm;
freqRange = (7022.7:78.03:8583.3) * 1e6;
d1 = dielectric();
d1.Thickness = 0.001588;
d1.EpsilonR = 2.33;
d1.LossTangent = 0.00051;
p.Layers = {rl,d1,rl,d1,rm};
p.FeedLocations = [0 0 3 5];
show(p)
figure(2);
% s = sparameters(p, freqRange); 
% rfplot(s) 