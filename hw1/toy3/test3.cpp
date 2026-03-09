#include "BinaryTree.h"
#include <functional>
#include <iostream>

bool testcase0() {
  BinaryTree tree;

  tree.add(0);
  tree.add(1);
  tree.add(2);
  tree.add(3);
  tree.add(4);
  tree.add(5);
  tree.add(-1);
  tree.add(-2);
  tree.add(-3);
  tree.add(-4);

  tree.remove(-2);
  tree.remove(2);
  tree.remove(1);
  tree.remove(5);

  return true;
}
bool testcase1() {
  BinaryTree tree;

  tree.add(0);
  tree.add(2);
  tree.add(1);
  tree.add(4);
  tree.add(3);
  tree.add(5);
  tree.add(-3);
  tree.add(-2);
  tree.add(-1);
  tree.add(-4);

  tree.remove(0);
  tree.remove(-2);
  tree.remove(2);
  tree.remove(1);
  tree.remove(5);

  return true;
}

bool testcase2() {
  BinaryTree tree;

  tree.add(0);

  tree.add(-3);
  tree.add(-2);
  tree.add(-1);
  tree.add(-4);

  tree.remove(0);
  tree.remove(-2);
  tree.remove(2);
  tree.remove(1);
  tree.remove(5);

  return true;
}

// TODO add test cases to achieve 100% line coverage in BinaryTree.cpp
std::function<bool()> tests[] = {testcase0, testcase1, testcase2};

int main() {
  unsigned ran = 0, passed = 0;
  for (auto test : tests) {
    ran++;
    passed += test();
  }
  std::cout << "Passed " << passed << "/" << ran << " test cases!" << std::endl;
  return 0;
}
