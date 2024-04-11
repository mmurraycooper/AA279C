clear
syms x y z l t ms ma real

Rbc = [
    1   0           0;
    0   sqrt(2)/2   sqrt(2)/2;
    0  -sqrt(2)/2   sqrt(2)/2
    ];

Ic = 1/12*ms*[
    l^2,    0,          0;
    0,      l^2+x^2,    0;
    0,      0,          x^2
];

Ib = simplify(Rbc*Ic*Rbc')
r_bcm_s1cm = [0;y/2+l*sqrt(2)/4; z/2+l*sqrt(2)/4];
Ib2 = simplifyFraction(Ib + ms*(eye(3)*dot(r_bcm_s1cm,r_bcm_s1cm) - r_bcm_s1cm*r_bcm_s1cm'))
Ia = 1/12*ma*[
    y^2+z^2, 0, 0;
    0, x^2+z^2, 0;
    0, 0, x^2+y^2
];

I = simplify(simplifyFraction(Ia + 2*Ib2))
x = 0.36601;
y = 0.11608;
z = 0.24155;
l = 0.59411;
ma = 11.936;
ms = 0.238;
vpa(subs(I))
