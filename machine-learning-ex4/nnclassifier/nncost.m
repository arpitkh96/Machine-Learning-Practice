function [THETA1_new, THETA2_new] = nncost(X, THETA1, THETA2,y, init_w=0, learn=0, alpha=0.01)
  if (init_w == 1)
     THETA1 = 2*rand(40,3) - 1;
     THETA2 = 2*rand(1,41) - 1;
  endif
  
  T1_DELTA = zeros(size(THETA1));
  T2_DELTA = zeros(size(THETA2));
  
  m = 0;
  
  J = 0.0;
  
  
  for i = 1:size(X,1)
    A1 = [1; X(i,:)'];
    
    Z2 = THETA1 * A1;
    
    A2 = [1; sigmoid(Z2)];
    
    Z3 = THETA2 * A2;
    
    h = sigmoid(Z3);
    
    J = J + ( y(i,:) * log(h) ) + ( (1 - y(i,:)) * log(1 - h) );
    
    m = m + 1;

    if (learn == 1)
      delta3 = h - y(i,:);
      
      delta2 = ((THETA2' * delta3) .* (A2 .* (1 - A2)))(2:end);
      T2_DELTA = T2_DELTA + (delta3 * A2');
      T1_DELTA = T1_DELTA + (delta2 * A1');
    else
      disp('Hypothesis for '), disp(y(i,1:2)), disp('is '), disp(h);
    endif
  endfor
  
  J = J / -m;
  
  if (learn==1)
    THETA1 = THETA1 - (alpha * (T1_DELTA / m));
    THETA2 = THETA2 - (alpha * (T2_DELTA / m));
  else
    disp('J: '), disp(J);
  end
  
  THETA1_new = THETA1;
  THETA2_new = THETA2;
  
end