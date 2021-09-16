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



const int n_registers=8; // number of "registers" in our array

long foo(void)
{
	int registers[n_registers]={0}; // array storing the register values
	int current=0; // current register number
	
	// your I/O and assembly simulator code here!
	std::string opcode;
	int number;
	while(true) {
		cin >> opcode;
		
		if(!cin) break;
		
		if(opcode == "load") {
			cin >> number;
			registers[current] = number;
		}
		else if(opcode == "add") {
			cin >> number;
			registers[current] += number;
		}
		else if(opcode == "usereg") {
			cin >> number;
			if(number < 0 || number >= n_registers) {
				cout << "invalid register " << number;
				exit(1);
			}
			current = number;
		}
		else if(opcode == "return") {
			cin >> number;
			if(number < 0 || number >= n_registers) {
				cout << "invalid register " << number;
				exit(1);
			}
			return registers[number];
		}
		else {
			cout << "invalid opcode " << opcode;
			exit(1);
		}
	}
	
	return registers[current];
}





