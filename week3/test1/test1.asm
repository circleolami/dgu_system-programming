test     start   1000                                            
first    lda     zero                                            
         ldch    charz                                           
         sub     diff                                            
         sta     alpha                                           
         lda     zero                                            
         ldx     zero                                            
cloop    ldch    chara                                           
         add     one                                             
         stch    str,x                                           
         tix     three                                           
         jlt     cloop                                           
         lda     zero                                            
zero     word    0                                               
one      word    1                                               
three    word    3                                               
diff     word    25                                              
chara    byte    c'a'                                            
charz    byte    c'z'                                            
alpha    resw    1                                               
str      resb    3                                               
         end     first                                           
three    word    3                                               
diff     word    25                                              
chara    byte    c'a'                                            
charz    byte    c'z'                                            
alpha    resw    1                                               
str      resb    3                                               
         end     first                                           
