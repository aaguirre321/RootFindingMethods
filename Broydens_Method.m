%% Broyden's Method

%% Information and set up
F= @(x) [(x(1))^2+x(2)-11;
         x(1)+(x(2))^2-7];

J= @(x) [2*x(1),1;
          1,2*x(2)];
x = [-1.0;
      1.0];
    
tol = 1e-7;                 % tolerance
max_iter = 100;              % max number of iterations
A_inv = inv(J(x));

%% Broyden's Method
i = 1;                      % iteration count
fprintf('i\tx\t\ty\t\terror\n');          % for display
fprintf('%d\t%.9f\t%.9f\n',0,x(1),x(2))
while( i <= max_iter) 
    
    z = A_inv*F(x);
    
    x_k=x-z;
    s=x_k-x;
    y=F(x_k)-F(x);
    A_inv = A_inv + ((s-A_inv*y)*transpose(s)*A_inv)/(transpose(s)*A_inv*y);
    
    x=x_k;
    
    % check stopping condition
    inf_error = max(abs(z));
    
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
    fprintf('\nBroyden''s Method approximated the solution x = (%.9f, %.9f) after %d iterations.\n\n',x(1),x(2),i);
else                        % not successful 
    fprintf('\nBroyden''s Method did not converge within the tolerance in %d iterations.\n\n',max_iter)
end