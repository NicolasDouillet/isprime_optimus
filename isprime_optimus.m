function is_prime = isprime_optimus(u)
%% isprime_optimus : function to fast perform primality test.
%
% Author : nicolas.douillet (at) free.fr, 2023-2024.
%
%
% Input
%
% - u : integer vector sorted in ascending order and starting at 1 (MANDATORY).
% 
%
% Output
%
% - is_prime : logical vector, the uinput u vector bitwise primality test resulting vector.
%              size(is_prime) = size(u).
%
%
% See also
%
% ISPRIME, PRIMES, FACTOR.


%% Body
is_prime = false(size(u)); % default

pm_pot_idx = mod(u.^2-1,24) == 0; % potential prime indices based on 'Christmas eve prime squares' expression
is_prime(u(pm_pot_idx)) = isprime(u(pm_pot_idx));

small_int_idx = u < 5; % indices below the ones the formula is working for
is_prime(u(small_int_idx)) = isprime(u(small_int_idx));


end % isprime_optimus