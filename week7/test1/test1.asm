test5    start   1000                                            
first    j       begin                                           
five     word    5                                               
xxx      resw    1                                               
begin    lda     zero                                            
         ldx     zero                                            
loop     lda     retloop                                         
         sta     retad                                           
         ldx     temp                                            
         j       getc                                            
         lda     s                                               
         sta     temp                                            
         lda     temp                                            
         mul     four                                            
         sta     s                                               
         lda     retloop                                         
         sta     retad                                           
         ldx     temp                                            
         j       getc                                            
         add     s                                               
         sta     s                                               
         stch    exaddr                                          
         tix     twelve                                          
         jlt     loop                                            
getc     stx     temp                                            
         ldx     incnt                                           
         lda     incnt                                           
         add     one                                             
         sta     incnt                                           
         ldch    indev                                           
         comp    eof                                             
         jeq     exaddr                                          
         comp    fortyeig                                        
         jlt     getc                                            
         sub     fortyeig                                        
         comp    ten                                             
         jlt     return                                          
         sub     seven                                           
return   ldx     temp                                            
         lda     retad                                           
         sta     retloop                                         
         rsub                                                    
s        resw    1                                               
zero     word    0                                               
one      word    1                                               
four     word    4                                               
twelve   word    12                                              
fortyeig word    48                                              
seven    word    7                                               
ten      word    10                                              
eof      word    63                                              
temp     resw    1                                               
retad    resw    1                                               
retloop  resw    1                                               
incnt    word    0                                               
indev    byte    c'0010030C1006'                                 
         byte    c'000005FFFFFF?'                                
exaddr   resb    12                                              
         end     first                                           
