% test isprime_optimus


n = 18; % primality of integers up to 2^n to test
isprime_cpu         = zeros(1,n);
isprime_optimus_cpu = zeros(1,n);


for k = 1:n
    
    % Matlab isprime raw function
    tic
    p = isprime(1:2^k);
    isprime_cpu(1,k) = toc;
    
    % My isprime optimus function (using isprime, but faster for high integer values thanks to an 'Christmas eve prime squares' expression optimal sampling)
    tic
    q = isprime_optimus(1:2^k);
    isprime_optimus_cpu(1,k) = toc;
    
    isequal(p,q); % to test equivalent primality resulting vector
    
end


figure;
semilogx(2.^(1:n),isprime_cpu,'Color',[1 0 0],'Linewidth',2), hold on;
semilogx(2.^(1:n),isprime_cpu,'r+','Linewidth',2), hold on;
semilogx(2.^(1:n),isprime_optimus_cpu,'Color',[0 0 1],'Linewidth',2), hold on;
semilogx(2.^(1:n),isprime_optimus_cpu,'b+','Linewidth',2), hold on;
grid on;

xlabel('Maximum integer value of the vector to test primality');
ylabel('CPU time (s)');
set(gcf,'Color',[1 1 1]), set(gca,'Color',[1 1 1],'FontSize',16);
axis tight;

legend('Matlab(r) stock isprime function','','isprime optimus function','','Location','northwest');