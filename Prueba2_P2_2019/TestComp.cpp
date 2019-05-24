#include <iostream>
#include "verilated.h"
#include "VComp.h"

int main(){
    VComp con;
    
    for(int cont=256;cont>=0;cont--){
        con.a=cont;
        for(int contb=0;contb<=256;contb++){
            con.b=contb;
            con.eval();

            if(con.r==getMayor(a,b))
                std::cout<<"Correcto";
            else{
                std::cout<<"Incorrecto";
            }    
        
    }*/
    staticCast(int)con.r;
}
int getMayor(int a,int b){
    if(a>b)
        return a;
    else
    {
        return b;
    }
        
}