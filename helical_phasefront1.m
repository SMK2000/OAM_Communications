% Plot Helical Phase front
k = 3;                        % play with this
r = linspace(0,5,10);
t = linspace(0,5);
[R,T] = meshgrid(r,t);
X = @(T) R.*cos(T);
Y = @(T) R.*sin(T);
Z = k.*T;
cla
n = 5;
hold on
for i = 1:n
    g = surf(X(T+2*pi*i/n),Y(T+2*pi*i/n),Z);
    set(g,'FaceColor',rand(1,3),'FaceAlpha',0.5)
end
hold off
axis equal