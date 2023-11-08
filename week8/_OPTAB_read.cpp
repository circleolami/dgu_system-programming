#include "SICreader.h"
using namespace std;

void buildOptab(vector<OpInfo> &optab)
{
    ifstream opFile;
    opFile.open("optab.txt");
    if (opFile.is_open())
    {
        while (!opFile.eof())
        {
            OpInfo temp;
            string line;
            bool foundSpace = false;
            getline(opFile, line);
            for (auto ch : line)
            {
                if (ch == ' ')
                    foundSpace = true;
                else
                {
                    if (!foundSpace)
                        temp.instruction += ch;
                    else
                        temp.code += ch;
                }
            }
            optab.push_back(temp);
        }
        opFile.close();
    }
}
