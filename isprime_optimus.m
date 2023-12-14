function is_prime = isprime_optimus(u) % u : integer vector sorted in ascending order
%
% Author and copyright : nicolas (dot) douillet (at) free (dot) fr, 2023.
% This code is related to a submitted publication and protected as so.


is_prime = false(size(u)); % default

pm_pot_idx = mod(u.^2-25,24) == 0; % potential prime indices based on 'Christmas eve prime squares' expression 
is_prime(u(pm_pot_idx)) = isprime(u(pm_pot_idx));

small_int_idx = u < 5; % indices below the ones the formula is working for
is_prime(u(small_int_idx)) = isprime(u(small_int_idx));


end % isprime_optimus