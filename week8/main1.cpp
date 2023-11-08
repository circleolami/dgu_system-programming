#include "SICreader.h"
using namespace std;

string checkOptab(const string &instruct, const vector<OpInfo> &optab)
{
    for (auto &ele : optab)
    {
        if (instruct == ele.instruction)
            return ele.code;
    }
    return "NULL";
}

bool isLowercase(string str)
{
    for (auto &ch : str)
    {
        if ('a' <= ch && ch <= 'z')
            return true;
    }
    return false;
}

int main()
{
    vector<OpInfo> optab;
    buildOptab(optab);
    string ipt;
    do
    {
        cout << "Input uppercase instruction : ";
        cin >> ipt;
    } while (isLowercase(ipt));
    string ans = checkOptab(ipt, optab);
    if (ans != "NULL")
        cout << ans << "\n";
    else
        cout << "Error : no matching instruction\n";
    return 0;
}
