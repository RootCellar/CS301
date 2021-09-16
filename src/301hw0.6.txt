/* NetRun C++ Wrapper (Public Domain) */
#include <cstdio>
#include <cstdlib>
#include <ctype.h>
#include <cstring>
#include <cmath>
#include <iostream>
#include <fstream>
#include <iomanip>
#include <vector>
#include <algorithm>
#include <iterator>
#include <map>
#include <string>
#include "lib/inc.h"
using std::cout;
using std::cin;



// The problem is this function:
int fix10(int bar) {
	int round10=bar/10*10; // bad ones are multiples of ten

	if (bar==round10)
	{
 	       bar=bar+1; // fix it
	}

	return bar;
}

// This function is OK:
void foo(void) {
	int bar;
	while (std::cin>>bar)
	{
		int fixed=fix10(bar);
		std::cout<<bar<<" -> "<<fixed<<std::endl;
	}
}



