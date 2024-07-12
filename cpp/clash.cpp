#include <algorithm>
#include <iostream>
#include <regex>
#include <string>
#include <vector>

using namespace std;

int main()
{
    string s;
    getline(cin, s);

    std::regex{RegexVariable}("[^A-Z]");
    std::string replaced_text = std::regex_replace(s, word_regex, "");
    std::cout << replaced_text << std::endl;
}
