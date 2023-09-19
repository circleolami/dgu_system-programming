test2    start   1000                                            
first    lda     one                                             
         sta     result                                          
double   lda     result                                          
         mul     two                                             
         sta     result                                          
         lda     result                                          
         comp    sixteen                                         
         jlt     double                                          
one      word    1                                               
two      word    2                                               
sixteen  word    16                                              
result   resw    1                                               
         end     first                                           
