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



long foo(long num) {
	/* your code here! */
	if(num == 0) return 1;
	int x = num;
	for(int i=1; i<num; i++) {
		x *= i;
	}
	return x;
}



