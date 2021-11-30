clear all;
clc;
%Fig 4B - Minimal regulation network for slope antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=(1+s1+s2)./(2+s1+s2);
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig4B.png')

%%
clear all;
clc;
%Fig 4D - Minimal conversion network for slope antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=(3+2*s1+2*s2)./(2+s1+s2);
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig4D.png')


%%
clear all;
clc;
%Fig 4D - Minimal binding network for slope antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=0.5*(5+s1+s2-(4+(1+s1+s2).^2).^(0.5));
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig4F.png')

%%
clear all;
clc;

%Fig 5B - Minimal regulation network for value antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=(3+3*s1+s1.^2+3*s2+s1.*s2+s2.^2)./((1+s1).*(1+s2));
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig5B.png')


%%
clear all;
clc;

%Fig 5D - Minimal conversion network for value antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=(5+2*s1.^2+s1.*(5+s2)+s2.*(5+2*s2))./(3+s1.^2+s1.*(3+s2)+s2.*(3+s2));
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig5D.png')


%%
clear all;
clc;


%Fig 5F - Minimal binding network for value antagonism


hold off;
figure(1); clf;
[s1,s2] = meshgrid(0:.5:10);
mreg=(4*(1+s1)+(1-s1+s2).^2).^(0.5);
h1=surf(s1,s2,mreg);
xlabel('S_1');
ylabel('S_2');
zlabel('m(S_1,S_2)')
set(gca,'fontsize',20);
set(gca,'fontweight','bold','fontname','arial')
box on;
set(gca, 'LineWidth', 3.5)
saveas(h1,'Fig5F.png')


