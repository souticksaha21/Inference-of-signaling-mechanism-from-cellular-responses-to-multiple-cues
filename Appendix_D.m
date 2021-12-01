%   m a b s1 s2
% m - - - 0 0
% a - - - - -
% b - - - - -
% s1 0 0 0 0 0
% s2 0 0 0 0 0 
% - = -1(repression),0(no node),1(activation)
% m,a,b,s1,s2=0/1

clc;
clear all;
tmax=1000; %maximum number of times the system is evolved to check for steady state
for i=1:5
Z(4,i)=0; %s1 is not impacted by anything
Z(5,i)=0; %s2 is not impacted by anything
end

%m is not affected by s1 and s2
Z(1,4)=0;
Z(1,5)=0;


i32=0;
imin=0;

%How does s1 and s2 impact A and B
for ns=1:3^4
    Z(2,5)=floor((ns-1)/3^3)-1;
    m=ns-3^3*floor((ns-1)/3^3)-1;
    Z(3,4)=floor(m/3^2)-1;
    m=m-3^2*floor(m/3^2);
    Z(2,4)=floor(m/3^1)-1;
    m=m-3^1*floor(m/3^1);
    Z(3,5)=floor(m/3^0)-1;
    
%How do other nodes impact each other, this is a 3X3 matrix with elements
%of m,a,b. So there are 3^(3X3)=3^9 possibilities
for n=1:3^9
    %Deciding the network interactions
    Z(3,3)=floor((n-1)/3^8)-1;
    m=n-3^8*floor((n-1)/3^8)-1;
    Z(3,2)=floor(m/3^7)-1;
    m=m-3^7*floor(m/3^7);
    Z(3,1)=floor(m/3^6)-1;
    m=m-3^6*floor(m/3^6);
    Z(2,3)=floor(m/3^5)-1;
    m=m-3^5*floor(m/3^5);
    Z(2,2)=floor(m/3^4)-1;
    m=m-3^4*floor(m/3^4);
    Z(2,1)=floor(m/3^3)-1;
    m=m-3^3*floor(m/3^3);
    Z(1,3)=floor(m/3^2)-1;
    m=m-3^2*floor(m/3^2);
    Z(1,2)=floor(m/3^1)-1;
    m=m-3^1*floor(m/3^1);
    Z(1,1)=floor(m/3^0)-1;
    


for in1=1:3
    %Fixing the input values which remains the same
    s(4,1)=floor(in1/2);
    m2=in1-2*floor(in1/2);
        s(5,1)=m2;

    is=1;
    imp(in1)=0;
for k=1:8
%Initialising m,a,b
s(1,1)=floor((k-1)/2^2);
m1=k-1-2^2*floor((k-1)/2^2);
s(2,1)=floor(m1/2);
m1=m1-2*floor(m1/2);
s(3,1)=m1;
nt=1;
it=1;
while nt>0 && it<tmax
    %input remains same
    s(4,it)=s(4,1);
    s(5,it)=s(5,1);

   for i1=1:3
       k1=0;
       for i2=1:5
       k1=k1+Z(i1,i2)*s(i2,it); %Calculating total interaction for m,a or b
       end
       if k1>0 %If net interaction is + then set the target node to 1
           s(i1,it+1)=1;
       elseif k1<0 %If net interaction is - then set the target node to 0
           s(i1,it+1)=0;
       else %If there is no net interaction then keep the target node unchanged
           s(i1,it+1)=s(i1,it);
       end
   end
   %steady state condition
   if s(1,it+1)==s(1,it) && s(2,it+1)==s(2,it) && s(3,it+1)==s(3,it)
       nt=0;
       %kt=1;
       imp(in1)=imp(in1)+2*s(1,it+1)-1;
       if s(1,it+1)== 1-(s(4,1)*s(5,1)) 
            is=is*1;
       else
          is=0; 
       end
   end
   it=it+1; %time update
end   
end
end
if imp(1)>0 && imp(2)>0 && imp(3)<min(imp(1),imp(2))
   i32=i32+1; %Index of a successful networks
   y00(i32)=25-sum(Z(:)==0); %Counting total number of edges in a successful network
   x00(i32)=i32;
   if y00(i32)==6
      imin=imin+1; %Index of succesful five node six edge network
      fprintf('Succesful five node six edge network number %d\n', imin);
      disp(Z); %Displaying the successful network
      net(1:5,1:5,imin)=Z(1:5,1:5); %Saving networks into a 3D array for plotting in the next part
   end
   
end
end
end

%%
%Plotting interactions of succesful five node six edge networks
mymap = [0.0 0.0 0.75
    0.75 0.75 0.75
    0.75 0.0 0.0];

figure(1); clf;
for j=1:18
   subplot(6,3,j)
   imagesc(net(1:5,1:5,j))  
   yticks([1 2 3 4 5]);
   yticklabels({'m','a','b','s_1','s_2'})
   xticks([1 2 3 4 5]);
   xticklabels({'m','a','b','s_1','s_2'})
   set(gca,'FontName', 'Arial');
   set(gca, 'fontweight', 'bold', 'fontsize', 12)
   set(gca, 'linewidth', 2);
   colormap(mymap)
end
ha = axes('Position',[0 0 0.5 1],'Xlim',[0 1],'Ylim',[0  1],'Box','off','Visible','off','Units','normalized', 'clipping' , 'off');
text(0.54, 0.98,'Chosen 5 node 6 edges regulatory networks', 'fontweight', 'bold', 'fontsize',20)
text(0.35, 0.95,'Red-activation, Grey-no interaction, Blue-repression (column affects row)', 'fontweight', 'bold', 'fontsize',18)
print(gcf,'Appendix_D_Chosen_networks.png','-dpng','-r600');

%%
%plotting number of selected five node regulatory networks for different edges
clr1=[0.85 0.35 0.35];
clr2=[0.5 0.5 0.5];
clr3=[0 0.8 0.8];
clr4=[0.8 0 0.8];

for j=1:18
   edges(j)=j; 
   networks(j)=nnz(y00==j); 
end

figure(2); clf;
plot1=line([6 6], [1 18],'Color',clr3,'linestyle','--','LineWidth', 3); hold on;
plot2=line([0 6], [18 18],'Color',clr4,'linestyle','-.','LineWidth', 3); hold on;
plot3=plot(edges(:),networks(:),...
    ':o','Color',clr2,... 
    'LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor',clr1);

set(gca,'FontSize',15)
ylim([1 4000]);
xlim([1 19]);
xlabel('Number of edges');
ylabel('Number of succesful networks');
set(gca, 'fontweight', 'bold', 'fontsize', 18)
set(gca, 'linewidth', 2);
set(gca, 'Yscale','log');
title('Regulatory networks in boolean framework', 'fontsize', 20);
set(gca,'FontName', 'Arial');
xticks ([1 3 6 9 12 15 18]);
yticks([10^(0) 10^(1) 10^(2) 10^3]);
yticklabels({'1','10','100','1000'})
h=legend([plot1 plot2], 'minimum 6 edges', '18 possible networks',...
'Location','southeast',...
    'FontSize',16);
box on;
ax = gca;
ax.YGrid = 'on';
ax.XGrid = 'on';
ax.YMinorGrid = 'off';
print(gcf,'Appendix_D_Succesful_regulation_network_vs_edges.png','-dpng','-r600');
