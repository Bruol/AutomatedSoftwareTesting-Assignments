#include "fizzbuzz.h"
#include <iostream>
#include <functional>

bool test_fizzbuzz(unsigned in, std::string out) {
    std::string res = fizzbuzz(in);
    if (res != out) {
        std::cout << in << ": expected=" << out << ", actual=" << res << std::endl;
        return false;
    }
    return true;
}

// TODO use exactly two (!) test cases to achieve 100% line coverage in fizzbuzz.cpp
std::function<bool()> tests[] = {
    [] () { return test_fizzbuzz(1, "1"); }
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
