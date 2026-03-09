#include "LinkedList.h"
#include <functional>
#include <iostream>
#include <stdexcept>

bool testcase0() {
  LinkedList list;
  list.push_back(5);
  list.push_back(5);
  list.push_front(5);
  list.push_front(5);
  list[1];
  list[2];
  list.erase(4);
  list.erase(3);
  list.erase(0);
  list.erase(0);
  list.erase(0);
  list.push_front(5);
  list.size();
  try {
    list[1];
  } catch (const std::out_of_range &e) {
    std::cout << "Caught exception: " << e.what() << std::endl;
  }
  return true;
}

// TODO add test cases to achieve 100% line coverage in LinkedList.cpp
std::function<bool()> tests[] = {
    testcase0,
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
