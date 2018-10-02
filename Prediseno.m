fmin = 7.25e9;
fmax = 8.4e9;
freqRange = (7022.7:78.03:8583.3) * 1e6;
f0 = sqrt(fmin*fmax);
lambda = 3e8/f0;
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
cp.GroundPlaneLength = a/100*4;
cp.GroundPlaneWidth = a/100*4;
cp.Substrate = dielectric("Name",'TLY-3',"EpsilonR",2.33,"LossTangent",0.0051,"Thickness",0.00152);

%Antena Plot
figure(1);
show(cp) 
figure(2);
s = sparameters(cp, freqRange); 
rfplot(s);

%Array

array = linearArray;
array.Element = cp;
array.NumElements = 7;
array.ElementSpacing = lambda/2;
hArray = figure;
figure(3);
show(array)
figure(4);
s = sparameters(array, freqRange); 
rfplot(s) ;

az_angle = 1:0.25:180;
pattern(array,f0,az_angle,0,'CoordinateSystem','rectangular')
axis([0 180 -25 15])

