#include <iostream>
#include <string>
#include <vector>
#include <algorithm>

int main(int argc, char **argv)
{
    std::string s = "run,barn,yellow,barracuda,shark,fish,swim";
    std::vector<std::string> words;
    size_t pos = 0;
    while ((pos = s.find(",")) != std::string::npos)
    {
        std::string token = s.substr(0, pos);
        words.push_back(token);
        s.erase(0, pos + 1);
    }
    words.push_back(s);
    std::sort(words.begin(), words.end(), [](std::string a, std::string b)
              { return a.size() > b.size(); });
    std::string result = *words.begin();
        std::for_each(result.begin(), result.end(), [](char & c) {
        c = (c == ' ') ? '': ::toupper(c);

        // write your solution here
}