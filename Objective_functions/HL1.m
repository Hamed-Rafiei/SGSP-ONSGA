function z1=HL1(Position)

%% stability creteria
Current.Cucz=20;
Current.Cncz=[53 86 119 152 185 218 251 284 317 340];
Current.Clcz=350;

%% linear profile

Current.Tucz=298; 
Current.Tncz=[306.18 314.36 322.54 330.72 338.9 347.09 355.27 363.45 371.63 379.81]; 
Current.Tlcz= 388; 
%% constant profile

% Current.Tucz=298; 
% Current.Tncz=[299 300 301 302 303 304 305 306 307 308 309]; 
% Current.Tlcz= 310; 
%% exponential profile
 
% Current.Tucz=298; 
% Current.Tncz=[328.21 348.28 361.62 370.47 376.36 380.26 382.86 384.58 385.73 386.49]; 
% Current.Tlcz= 387; 
%% reference profile

% Current.Tucz=298; 
% Current.Tncz=[314 327 337 345 351 358 360 363 366 367]; 
% Current.Tlcz= 368; 

% temps
T=[Current.Tucz Current.Tncz Current.Tlcz];

%%
sumation=0;
for k=length(Position):-1:2
    deltaT=T(k)-T(k-1);
    drhodT=-0.4;
    alpha=-(1/rho(Position(k),T(k)))*(drhodT);
    deltaS=Position(k)/rho(Position(k),T(k))-Position(k-1)/rho(Position(k-1),T(k-1));
    drhodS=0.65*rho(Position(k),T(k));
    Beta=(1/rho(Position(k),T(k)))*(drhodS);
    RP=Beta*deltaS/(alpha*deltaT+1e-8);
    sumation=sumation+max(0,(3-RP));
end
z1=sumation;

end
%
function chegaly=rho(C,T)
chegaly=998+0.65*C-0.4*(T-273-20);
end