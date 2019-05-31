#include <iostream>
#include "verilated.h"
#include "Vprueba.h"
#include "Vprueba_prueba.h"

using namespace std;
void reset(Vprueba &prueba);
void clkPulse(Vprueba& prueba);
int number_of_digits(unsigned int n) {
    int count = 0;
   
    while(n != 0) {
        n /= 10;
        ++count;
    }
   
    return count;
}

int main(){
    int numeros[10]={1,12,100,1000,10000,100000,1000000,12412341,123423,54234556};
    Vprueba prueba;
    prueba.clk=0;
    
            for(int i=0;i<10;i++){
            reset(prueba);
            prueba.numero=numeros[i];
            prueba.eval();
            while (prueba.prueba->current != 3) {
                clkPulse(prueba);
                //std::cout << "cs = " << static_cast<int>(prueba.prueba->current) << '\n';
            }
            if (prueba.retorno != (number_of_digits(numeros[i]))) {
                std::cout << "\x1b[31mERROR:\x1b[0m Unexpected result: " << prueba.retorno
                          << ", expected " << (number_of_digits(numeros[i])) << '\n';
            }
            }
            
            /*std::cout << i << " * " << j << " = " << vmult.product
                    << ", cs = " << static_cast<int>(vmult.Multiply->cs)
                    << '\n';*/
        
    
    prueba.final();

    //cout<<"Number: "<<number_of_digits(2000);
}
void clkPulse(Vprueba& prueba)
{
    prueba.clk = 1;
    prueba.eval();
    prueba.clk = 0;
    prueba.eval();
}
 
void reset(Vprueba& prueba)
{
    prueba.rst = 1;
    clkPulse(prueba);
    prueba.rst = 0;
}