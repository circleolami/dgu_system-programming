#include <iostream>
#include <fstream>
#include <sstream>
#include <string>

std::string parseCodes(const std::string &codes)
{
    std::stringstream ss;
    try
    {
        for (size_t i = 0; i < codes.length(); i += 2)
        {
            int code = std::stoi(codes.substr(i, 2), nullptr, 16);
            ss << code;
            if (i < codes.length() - 2)
                ss << ", ";
        }
    }
    catch (const std::invalid_argument &e)
    {
        std::cerr << "Invalid argument: " << e.what() << std::endl
                  << std::endl;
        return "";
    }
    catch (const std::out_of_range &e)
    {
        std::cerr << "Out of range: " << e.what() << std::endl
                  << std::endl;
        return "";
    }
    return ss.str();
}

void printColumn(const std::string &field, int start, int length)
{
    std::cout << "Col." << start << "-" << (start + length - 1) << ": " << field;
}

int main()
{
    std::ifstream infile("objfile.txt");
    if (!infile)
    {
        std::cerr << "Can't open the file" << std::endl
                  << std::endl;
        return 1;
    }

    std::string line;
    std::string progName, addr, size, length, codes;

    while (std::getline(infile, line))
    {
        char tag = line[0];

        switch (tag)
        {
        case 'H':
            progName = line.substr(1, 6);
            addr = line.substr(7, 6);
            size = line.substr(13, 6);
            std::cout << "TAG, PROGNAME, ADDR, SIZE" << std::endl;
            std::cout << "(Col.1: H ";
            printColumn("program name", 2, 6);
            std::cout << ", ";
            printColumn("Addr", 8, 6);
            std::cout << ", ";
            printColumn("SIZE", 14, 6);
            std::cout << ")";
            std::cout << std::endl;
            std::cout << "Tag=H, ProgName=" << progName
                      << ", Addr=" << addr
                      << ", Size=" << size << std::endl
                      << std::endl;
            break;
        case 'T':
            addr = line.substr(1, 6);
            length = line.substr(7, 2);
            codes = line.substr(9);
            std::cout << "TAG, ADDR, LENGTH, CODES" << std::endl;
            std::cout << "(Col.1: T ";
            printColumn("Addr", 2, 6);
            std::cout << ", ";
            printColumn("Length", 8, 2);
            std::cout << ", ";
            printColumn("Codes", 10, codes.length() / 2);
            std::cout << ")";
            std::cout << std::endl;
            std::cout << "Tag=T, Addr=" << addr
                      << ", Length=" << length
                      << ", Codes=" << parseCodes(codes) << std::endl
                      << std::endl;
            break;
        case 'E':
        case 'M':
            addr = line.substr(1, 6);
            codes = line.substr(7);
            std::cout << "TAG, ADDR, OTHERS" << std::endl;
            if (tag == 'M')
            {
                std::cout << "(Col.1: M ";
                printColumn("Addr", 2, 6);
                std::cout << ", ";
                printColumn("Others", 8, codes.length() / 2);
                std::cout << ")";
            }
            else
            {
                std::cout << "(Col.1: E ";
                printColumn("Addr", 2, 6);
                std::cout << ", ";
                std::cout << "Others (none)";
                std::cout << ")";
            }
            std::cout << std::endl;
            std::cout << "Tag=" << tag << ", Addr=" << addr
                      << ", Others=" << codes << std::endl
                      << std::endl;
            break;
        default:
            std::cerr << "Unknown tag: " << tag << std::endl
                      << std::endl;
            break;
        }
    }

    infile.close();
    return 0;
}
