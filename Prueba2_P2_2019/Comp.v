module comparador(
    input [7:0]a,
    input [7:0]b,
    output r
);
wire numA[7:0];
wire numB[7:0];
assign numA=a;
assign numB=b;
wire respa[7:0];
wire respb[7:0];
always @(*) begin
    if(numA && numB)begin
         respa[0]=numA[0]; 
         respb[0]=numB[0];   
        end 
    //1
      if(numA && numB)begin
         respa[1]=numA[1]; 
         respb[1]=numB[1];   
        end 
    //2
      if(numA && numB)begin
         respa[2]=numA[2]; 
         respb[2]=numB[2];   
        end 
    //3
       if(numA && numB)begin
         respa[3]=numA[3]; 
         respb[3]=numB[3];   
        end 
    //4
        if(numA && numB)begin
         respa[4]=numA[4]; 
         respb[4]=numB[4];   
        end 
    //5
        if(numA && numB)begin
         respa[5]=numA[5]; 
         respb[5]=numB[5];   
        end 
    //6
        if(numA && numB)begin
         respa[6]=numA[6]; 
         respb[6]=numB[6];   
        end 
    //7
         if(numA && numB)begin
         respa[7]=numA[7]; 
         respb[7]=numB[7];   
        end                              
end
assign r=respa[7];
endmodule // 