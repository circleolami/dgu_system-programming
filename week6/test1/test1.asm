test     start   1000                                            
first    lda     zero                                            
         ldx     zero                                            
         sta     readi                                           
         sta     writei                                          
         lda     ten                                             
         sta     splited                                         
loop     ldx     readi                                           
         ldch    src,x                                           
         comp    delimit                                         
         jeq     skip                                            
         j       append                                          
skip     lda     readi                                           
         sta     splited                                         
         lda     zero                                            
         sta     writei                                          
         j       nxtrd                                           
append   lda     readi                                           
         comp    splited                                         
         ldch    src,x                                           
         jlt     hap                                             
         jgt     tap                                             
hap      ldx     writei                                          
         stch    head,x                                          
         j       nxtwrt                                          
tap      ldx     writei                                          
         stch    tail,x                                          
         j       nxtwrt                                          
nxtwrt   ldx     writei                                          
         tix     ten                                             
         stx     writei                                          
nxtrd    ldx     readi                                           
         tix     ten                                             
         stx     readi                                           
         jlt     loop                                            
         rsub                                                    
src      byte    c'cute.pingu'                                   
zero     word    0                                               
one      word    1                                               
ten      word    10                                              
delimit  word    46                                              
splited  resw    1                                               
readi    resw    1                                               
writei   resw    1                                               
head     resb    3                                               
tail     resb    3                                               
exit     end     first                                           
