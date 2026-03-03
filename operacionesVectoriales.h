#ifndef OPERACIONES_VECTORIALES_H
#define OPERACIONES_VECTORIALES_H

#include <stddef.h> // Necesario para size_t

/**
 * @brief Calcula y = a * x + y (SAXPY) de forma escalar.
 * @param n Cantidad de elementos.
 * @param a Escalar por el que se multiplica el vector x.
 * @param x Puntero al vector de entrada (read-only).
 * @param y Puntero al vector de entrada/salida.
 */
void saxpy_scalar(size_t n, float a, const float *x, float *y);

/**
 * @brief Calcula y = a * x + y usando extensiones vectoriales RISC-V.
 * Aprovecha el diseño VLA (Vector Length Agnostic) para procesar
 * tantos elementos como permita el hardware en cada iteración.
 */
void saxpy_vec(size_t n, float a, const float *x, float *y);

#endif // OPERACIONES_VECTORIALES_H

