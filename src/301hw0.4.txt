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



void foo(void) {
	/* Your code here! */
	std::vector<int> answers;
	std::string name;
	int answer;
	
	while(true) {
		
		cin >> name;
		cin >> answer;
		
		if(!cin) {
			return;
		}
		
		bool copies = false;
		for( int i : answers ) {
			if(answer == i) {
				copies = true;
				cout << name << " copies work" << std::endl;
			}
		}
		
		if(!copies) {
			answers.push_back(answer);
		}
		
	}
}



