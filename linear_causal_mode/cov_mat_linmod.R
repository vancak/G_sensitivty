###############################################################
##### cov matrix for alpha & psi in linear causal model  ######
###############################################################

bread_alph = function(psi, alpha){ 
  n ^ (-1)        * matrix( c(-n,
                              0,
                              sum( -( y - psi * x - alpha * z ) ),
                              sum( -x * ( z - mean(z) ) ) ), 
                            ncol  = 2, 
                            byrow = T) } 

meat_alph  = function(psi, alpha){ 
  n ^ (-1) * matrix( c( sum( ( z - mean(z) ) ^ 2 ), 
                        sum( ( z - mean(z) ) ^ 2 * ( y - psi * x - alpha * z ) ), 
                        sum( ( z - mean(z) ) ^ 2 * ( y - psi * x - alpha * z ) ), 
                        sum( ( z - mean(z) ) ^ 2 * ( y - psi * x - alpha * z ) ^ 2 ) ), 
                     ncol  = 2, 
                     byrow = T ) }

v_cov_alph = function(psi, alpha) { solve(bread_alph( psi,  alpha )) %*% 
                                     meat_alph(        psi,  alpha)   %*%
                                     t(solve(bread_alph(psi,  alpha))) }
