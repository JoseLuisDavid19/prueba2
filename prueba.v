module prueba(
    input clk,
    input rst,
    input [31:0] numero,
    output reg[31:0] retorno
);
parameter inicio =3'd0;
parameter ciclo =3'd1;
parameter divido =3'd2;
parameter fin=3'd3;

reg[31:0]counter;
reg[31:0]counterprime;
reg[2:0]current/*verilator public*/;
reg[2:0]nextState;
reg[31:0]newNumber;
reg[31:0]newNumberPrime;
always @(posedge clk) begin
    if(rst)
        current<=inicio;
    else
        current<=nextState;    
end
always @(posedge clk) begin
    newNumber<=newNumberPrime; 
    counter<=counterprime;          
end

always @(*) begin
    case(current)
    inicio:begin
        counterprime=32'd0;
        newNumberPrime=numero;
        nextState=ciclo;
    end
    ciclo:
        if(newNumber==32'd0)
            nextState=fin;
        else
            nextState=divido;
    divido:begin
        newNumberPrime=newNumber/10;
        counterprime=counter + 32'd1;
        nextState=ciclo;
    end
    fin:retorno=counter;

    default:nextState=3'bxxx;
    endcase
end


endmodule // 