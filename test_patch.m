fmin = 7.25e9;
fmax = 8.4e9;
%freqRange = (7022.7:78.03:8583.3) * 1e6;
freqRange = linspace(6e9,10e9,1000);
f0 = sqrt(fmin*fmax);
lambda = 3e8/f0;
%Material TLY-3
Er = 2.23;
h = 0.1588; %cm

W = (30/(2*f0/1e9))*sqrt(2/(Er+1)); %cm
Eeff = (Er+1)/2 + ((Er-1)/2)*(1/sqrt(1+12*(h/W)));
Wh = W/h;
IncL = h*0.412*(((Eeff+0.3)*(Wh+0.264))/((Eeff-0.258)*(Wh+0.8))); %cm
Leff = 3e8/(2*sqrt(Eeff)*f0)*100;
L = Leff - 2*IncL; %cm
L = L/100; %m
W = W/100;
h = h/100;

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