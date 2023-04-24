clc
%% Newton's Method

%% Information and set up
F= @(x) [(x(1))^2+x(2)-11;
         x(1)+(x(2))^2-7];

 J= @(x) [2*x(1),1;
          1,2*x(2)];


x = [-1.0;
      1.0];
    
tol = 1e-7;                 % tolerance
max_iter = 100;              % max number of iterations

%% Newton's Method
i = 1;                      % iteration count
fprintf('i\tx\t\ty\t\terror\n');          % for display
fprintf('%d\t%.9f\t%.9f\n',0,x(1),x(2))
while( i <= max_iter)
    % get p_i 
    
    y = J(x) \ -F(x);
    
    x=x+y;   
    
    % check stopping condition
    inf_error = max(abs(y));
    
    % display information
    fprintf('%d\t%.9f\t%.9f\t%.9f\t\n',i,x(1),x(2),inf_error);  
    
    if(inf_error < tol)
        break;
    end
    
    % increase iteration count
    i = i + 1;
    
    
end

%% Display Information
if( i <= max_iter )         % successful
    fprintf('\nNewton''s Method approximated the solution x = (%.9f, %.9f) after %d iterations.\n\n',x(1),x(2),i);
else                        % not successful 
    fprintf('\nNewton''s Method did not converge within the tolerance in %d iterations.\n\n',max_iter)
end