test2    start   1000                                            
first    lda     one                                             
         jsub    double                                          
         sta     result                                          
double   mul     two                                             
         comp    sixteen                                         
         jlt     double                                          
         rsub                                                    
one      word    1                                               
two      word    2                                               
sixteen  word    16                                              
result   resw    1                                               
         end     first                                           
