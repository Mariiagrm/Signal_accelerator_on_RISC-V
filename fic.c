#include <stdio.h>

#define FILTER_TAP_NUM 5 //Orden del filtro + 1 por muestra actual
// Coeficientes del filtro (ejemplo pasabajo)
float h[FILTER_TAP_NUM] = {0.1, 0.2, 0.4, 0.2, 0.1}; 
float x[FILTER_TAP_NUM] = {0}; // Búfer de muestras (historial)

float fir_filter(float input) {
    float output = 0;
    
    // 1. Desplazar muestras en el búfer
    for (int i = FILTER_TAP_NUM - 1; i > 0; i--) {
        x[i] = x[i - 1];
    }
    x[0] = input; // Nueva muestra

    // 2. Convolución: multiplicar y sumar
    for (int i = 0; i < FILTER_TAP_NUM; i++) {
        output += h[i] * x[i];
    }
    
    return output;
}

int main() {
    float entrada[] = {1.0, 0.5, 0.0, -0.5, -1.0, 0.0, 0.0};
    int n = sizeof(entrada) / sizeof(entrada[0]);
    
    for (int i = 0; i < n; i++) {
        printf("Entrada: %f, Salida: %f\n", entrada[i], fir_filter(entrada[i]));
    }
    return 0;
}
