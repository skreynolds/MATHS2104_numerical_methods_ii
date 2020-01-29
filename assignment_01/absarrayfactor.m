function af = absarrayfactor(aj,phi,kd)

%   Shane Reynolds 20/08/2012

%   Vectorised code computing formula (1) on the assignment sheet
%   AF(phi) called the array factor

    af = abs(sum(repmat(aj',length(phi),1)...
        .*cos(repmat((1:length(aj)) - 1/2, length(phi),1)...
            .*kd.*cos(repmat(phi,1,length(aj)))),2));

end