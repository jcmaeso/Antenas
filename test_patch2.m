fmin = 7.25e9;
fmax = 8.4e9;
freqRange = (7022.7:78.03:8583.3) * 1e6;
freqRange = linspace(5e9,10e9,500);
f0 = sqrt(fmin*fmax);

%Material TLY-3
Er = 2.33;
h = 0.1588; %cm

%Diseno Antena
F = 8.791e9/(f0*sqrt(Er));
a = F/sqrt(1+ 2*h*log(1.7726+pi*F/(2*h))/(pi*Er*F)); %cm

cp = patchMicrostripCircular;
cp.Radius = a/100;
cp.Height = h/100;
cp.FeedOffset = [0 0.002];
cp.GroundPlaneLength = 0.0342;
cp.GroundPlaneWidth = 0.0342;
cp.Substrate = dielectric("Name",'TLY-3',"EpsilonR",2.33,"LossTangent",0.0051,"Thickness",0.00152);

%Antena Plot
figure(1);
show(cp) 

p = pcbStack;
rl = antenna.Circle('Center',[0,0],'Radius',a/100);
rm = antenna.Rectangle('Center',[0,0],'Length',0.0342,'Width',0.0342);
p.BoardThickness = 0.001588*2;
p.BoardShape = rm;
d1 = dielectric();
d1.Thickness = 0.001588;
d1.EpsilonR = 2.33;
d1.LossTangent = 0.00051;
p.Layers = {rl,d1,rl,d1,rm};
p.FeedLocations = [0 0 3 5];
show(p)
figure(2);
s = sparameters(p, freqRange); 
rfplot(s) 