function z5=HC3(Position)

%% least diffusivity
Current.Cucz=20;
Current.Cncz=[53 86 119 152 185 218 251 284 317 340];
Current.Clcz=350;

%% linear profile

% Current.Tucz=298; 
% Current.Tncz=[306.18 314.36 322.54 330.72 338.9 347.09 355.27 363.45 371.63 379.81]; 
% Current.Tlcz= 388; 
%% constant profile

Current.Tucz=298; 
Current.Tncz=[299 300 301 302 303 304 305 306 307 308 309]; 
Current.Tlcz= 310; 
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
    sumation=sumation+abs(Position(k)-Position(k-1));    
end
z5=sumation;

end
