#include <functional>
#include <iostream>
#include <map>
#include <ranges>
#include <vector>

using namespace std;

int main() {
  std::vector<int> a = {1, 2, 3, 4, 5};
  std::vector<int> b = {1, 2, 3, 4, 5};
  std::vector<int> c;
  printf("test theft test\n");
  // std::transform(a.begin(), a.end(), b.begin(), std::back_inserter(c),
  //                [](const auto &aa, const auto &bb) { return aa * bb; });
  // for (auto cc : c)
  //   std::cout << cc << std::endl;
}
