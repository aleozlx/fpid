if kp*kp>=4*ki*kd
    GCE = GE*(kp-sqrt(kp*kp-4*ki*kd))/2/ki;
    GCU = ki/GE;
    GU = kd/GCE;
else % the PID control can not be transformed into fuzzy PID 
    % because there's no solution for gain parameters
    GCE = GE*(kp-imag(sqrt(kp*kp-4*ki*kd)))/2/ki; % use imaginary part only
    % uncertain of its limitation...
    GCU = ki/GE;
    GU = kd/GCE;
end

