/*
 * MATLAB Compiler: 4.14 (R2010b)
 * Date: Mon Aug 04 15:08:51 2014
 * Arguments: "-B" "macro_default" "-t" "-W" "libhg:dlltest" "-T" "link:lib"
 * "-h" "libmmfile.mlib" "sd.m" 
 */

#ifndef __dlltest_h
#define __dlltest_h 1

#if defined(__cplusplus) && !defined(mclmcrrt_h) && defined(__linux__)
#  pragma implementation "mclmcrrt.h"
#endif
#include "mclmcrrt.h"
#ifdef __cplusplus
extern "C" {
#endif

#if defined(__SUNPRO_CC)
/* Solaris shared libraries use __global, rather than mapfiles
 * to define the API exported from a shared library. __global is
 * only necessary when building the library -- files including
 * this header file to use the library do not need the __global
 * declaration; hence the EXPORTING_<library> logic.
 */

#ifdef EXPORTING_dlltest
#define PUBLIC_dlltest_C_API __global
#else
#define PUBLIC_dlltest_C_API /* No import statement needed. */
#endif

#define LIB_dlltest_C_API PUBLIC_dlltest_C_API

#elif defined(_HPUX_SOURCE)

#ifdef EXPORTING_dlltest
#define PUBLIC_dlltest_C_API __declspec(dllexport)
#else
#define PUBLIC_dlltest_C_API __declspec(dllimport)
#endif

#define LIB_dlltest_C_API PUBLIC_dlltest_C_API


#else

#define LIB_dlltest_C_API

#endif

/* This symbol is defined in shared libraries. Define it here
 * (to nothing) in case this isn't a shared library. 
 */
#ifndef LIB_dlltest_C_API 
#define LIB_dlltest_C_API /* No special import/export declaration */
#endif

extern LIB_dlltest_C_API 
bool MW_CALL_CONV dlltestInitializeWithHandlers(
       mclOutputHandlerFcn error_handler, 
       mclOutputHandlerFcn print_handler);

extern LIB_dlltest_C_API 
bool MW_CALL_CONV dlltestInitialize(void);

extern LIB_dlltest_C_API 
void MW_CALL_CONV dlltestTerminate(void);



extern LIB_dlltest_C_API 
void MW_CALL_CONV dlltestPrintStackTrace(void);

extern LIB_dlltest_C_API 
bool MW_CALL_CONV mlxSd(int nlhs, mxArray *plhs[], int nrhs, mxArray *prhs[]);

extern LIB_dlltest_C_API 
long MW_CALL_CONV dlltestGetMcrID();



extern LIB_dlltest_C_API bool MW_CALL_CONV mlfSd();

#ifdef __cplusplus
}
#endif
#endif
