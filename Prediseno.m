fmin = 7.25e9;
fmax = 8.4e9;
f0 = sqrt(fmin*fmax);

%Material TLY-3
Er = 2.33;
h = 1.52;

%Diseno Antena
F = 8.791e9/(f0*Er);
a = F/sqrt(1+ 2*h*log(1.7726+pi*F/(2*h))/(pi*Er*F));

%Circular Antenna
cp = patchMicrostripCircular;
cp.Radius = a;
cp.Substrate = dielectric('Air');
cp.GroundPlaneLength = 1;
cp.GroundPlaneWidth = 1;

figure(1);
show(cp);
%figure(2);
%pattern(cp, f0);
%figure(3);
%impedance(cp,linspace(1e9,10e9));


%Array

la = linearArray;
la.NumElements = 6;
layout(la);
la.Element = cp;
show(la);


