clc;
%                       newtonRoot.m
%
% A Matlab script that implements Newton's method for 
% finding the roots of the non-linear equation x^2 - 3.0
%
% This is not a robust code - there is no code that 
% terminates the iteration if too many iterates are taken. 

fstring = 'x^2-1';      % target function 
%dfstring = '2.0*x';        % target functions derivative


x0  = 0.9;                % initial guess
eps = 1.0e-12;            % stopping tolerance
format long;              % print out in long format
format compact;           % suppress line feeds

xn  = x0;

eval(['x = xn;',fstring,';']);     % evaluate f  at xn
fn = ans; 
%eval(['x = xn;',dfstring,';']);    % evaluate f' at xn
%dfn = ans; 
%df0 = dfn;                         % this is f' at x0 = 5.
p = sqrt(2);                      % the true root
errors=[];
iter = 0;
xold = 0.;
errEst = abs(fn-p);                  % initial residual: |f(p_0)|
while (errEst > eps)

   %xold = xn;
   %xn  = xn - fn/dfn;              % Newton iteration
   %xn  = xn - fn/df0;
   xn=fn; % Regula falsi
   
   errors = [errors, abs(p-xn)];   % store |p-p_n| at each iteration
   disp(sprintf(['Approximate root is %-15.15f'],xn))
   
   eval(['x = xn;',fstring,';']);     % evaluate the f  at xn
   fn = ans; 
   %eval(['x = xn;',dfstring,';']);    % evaluate the f' at xn
   %dfn = ans; 
   iter = iter+1;
   errEst = abs(fn-p);                  % compute residual to check above
end

 
% Print out final results
%
absErr = abs(xn - p);                 % absolute error
disp("***   Final results are:   ***")
disp(sprintf(['Approximate root of %s    : %-15.16f '],fstring,xn))
disp(sprintf(['Initial iterate           : %-15.16f '],x0))
disp(sprintf(['Residual                  : %-15.16e '],fn))
disp(sprintf(['Absolute error bound : %-15.16e'],absErr))
disp(sprintf(['Iterations required       : %-5d'],iter))

for i = 1:length(errors)
    fprintf("Iteration %d error in the approx root is %-15.15f\n",i,errors(i))
end

for k=2:length(errors)-1
    alpha = (log(errors(k+1)/errors(k)))/(log(errors(k)/errors(k-1)));
    fprintf("%-15.15f\n",alpha)
end


