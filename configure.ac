AC_INIT([vinit], [0.0.1], [ian@mkall.org])

CFLAGS="-Werror=implicit -Werror=implicit-function-declaration \\
	-Werror=implicit-int -Werror=int-conversion \\
	-Werror=incompatible-pointer-types -Werror=int-to-pointer-cast \\
	-Werror=return-type -Wunused -pedantic"


AC_ARG_WITH([cc], 
  [AS_HELP_STRING([--with-cc=<cc>], [Specify the c compiler])],
  [c_compiler="$withval"], [c_compiler="gcc"])

AC_ARG_WITH([ld],
  [AS_HELP_STRING([--with-ld=<ld>], [Specify the linker])],
  [c_ld="$withval"], [c_ld="ld"])

AC_ARG_WITH([src],
  [AS_HELP_STRING([--with-src=<src_dir>], [Specify the source directory])],
  [src_dir="$withval"], [src_dir="src"])

AC_SUBST(CFLAGS, [$CFLAGS])
AC_SUBST(CC, [$c_compiler])
AC_SUBST(LD, [$c_ld])
AC_SUBST(SRC_DIR, [$src_dir])

AC_CONFIG_FILES([Makefile])
AC_OUTPUT
