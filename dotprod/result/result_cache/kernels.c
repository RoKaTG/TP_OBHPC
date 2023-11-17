//
#if defined(__INTEL_COMPILER)
#include <mkl.h>
#else
#include <cblas.h>
#endif

#include <omp.h>

//
#include "types.h"

//Baseline - naive implementation
f64 dotprod_base(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  
  for (u64 i = 0; i < n; i++)
    d += a[i] * b[i];

  return d;
}

f64 dotprod_unroll4(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  u64 i;

  for (i = 0; i < n - 3; i += 4)
  {
    d += a[i] * b[i];
    d += a[i + 1] * b[i + 1];
    d += a[i + 2] * b[i + 2];
    d += a[i + 3] * b[i + 3];
  }

  for (i; i < n; i++)
    d += a[i] * b[i];

  return d;
}

f64 dotprod_unroll8(f64 *restrict a, f64 *restrict b, u64 n)
{
  double d = 0.0;
  u64 i;

  for (i = 0; i < n - 7; i += 8)
  {
    d += a[i] * b[i];
    d += a[i + 1] * b[i + 1];
    d += a[i + 2] * b[i + 2];
    d += a[i + 3] * b[i + 3];
    d += a[i + 4] * b[i + 4];
    d += a[i + 5] * b[i + 5];
    d += a[i + 6] * b[i + 6];
    d += a[i + 7] * b[i + 7];
  }

  for (i; i < n; i++)
    d += a[i] * b[i];

  return d;
}

f64 dotprod_cblas(f64 *restrict a, f64 *restrict b, u64 n) {
  return cblas_ddot(n, a, 1, b, 1);
}

f64 dotprod_openmp(f64 *restrict a, f64 *restrict b, u64 n) {
  double d = 0.0;

  #pragma omp parallel for reduction(+:d)
  for (u64 i = 0; i < n; i++)
    d += a[i] * b[i];

  return d;
}



