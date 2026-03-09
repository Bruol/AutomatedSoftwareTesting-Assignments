#include "LinkedList.h"
#include <iostream>
#include <functional>

bool testcase0() {
    LinkedList list;
    list.push_back(5);

    return list.size() == 1;
}

// TODO add test cases to achieve 100% line coverage in LinkedList.cpp
std::function<bool()> tests[] = {
        testcase0
};

int main() {
    unsigned ran = 0, passed = 0;
    for (auto test : tests) {
        ran++;
        passed += test();
    }
    std::cout << "Passed " << passed << "/" << ran << " test cases!" << std::endl;
    return 0;
}

