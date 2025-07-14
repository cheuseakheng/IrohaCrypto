#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FGETS_BUFSIZE 64

/* Problem with FreeBSD 10.3 fgets() with stdin. */
static void
pl_freebsd_fgets(void)
{
	char buf[FGETS_BUFSIZE];

	if (fgets(buf, FGETS_BUFSIZE, stdin) == NULL)
		exit(1);
}

/* Problem with FreeBSD 12.0 and printf(). */
static void
pl_freebsd_printf_space(void)
{

	printf(" ");
}

/* Problem with FreeBSD 12.0 and printf(). */
static void
pl_freebsd_printf_space_newline(void)
{

	printf(" \n");
}

/* Problem with FreeBSD 12.0 and strerror(). */
static void
pl_freebsd_strerror(void)
{
	char * str = strerror(0);

	(void)str; /* UNUSED */
}

#define MEMLEAKTEST(x) { #x, x }
static const struct memleaktest {
	const char * const name;
	void (* const volatile func)(void);
} tests[] = {
	MEMLEAKTEST(pl_freebsd_fgets),
	MEMLEAKTEST(pl_freebsd_printf_space),
	MEMLEAKTEST(pl_freebsd_printf_space_newline),
	MEMLEAKTEST(pl_freebsd_strerror)
};
static const int num_tests = sizeof(tests) / sizeof(tests[0]);

int
main(int argc, char * argv[])
{
	int i;

	if (argc == 2) {
		/* Run the relevant function. */
		for (i = 0; i < num_tests; i++) {
			if ((strcmp(argv[1], tests[i].name)) == 0) {
				tests[i].func();
				goto success;
			}
		}

		/* We didn't find the desired function name. */
		goto err0;
	} else {
		/* Print test names. */
		for (i = 0; i < num_tests; i++)
			printf("%s\n", tests[i].name);
	}

success:
	/* Success! */
	exit(0);

err0:
	/* Failure! */
	exit(1);
}
