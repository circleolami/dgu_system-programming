#ifndef SICREADER_H
#define SICREADER_H

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <algorithm>

class SymbolReader;

class OpInfo{
public:
	std::string instruction;
	std::string code;
	OpInfo& operator=(const OpInfo& rhs){
		if (this == &rhs) return *this;
		instruction = rhs.instruction;
		code = rhs.code;
		return *this;
	}
	friend class SymbolReader;
};

class Line{
private:
	std::string label;
	std::string opcode;
	std::string operand;
public:
	Line (std::string lb, std::string opc, std::string oper) {
		label = lb;
		opcode = opc;
		operand = oper;
	}
	friend std::ostream& operator << (std::ostream &out, const Line & line) {
		out << "Label: ";
		out.width(8);
		if (line.label == "") out << std::left << "-";
		else out << std::left << line.label;
		out << " Opcode: ";
		out.width(6);
		if (line.opcode == "") out << std::left << "-";
		else out << std::left << line.opcode;
		out << " Operand:";
		out.width(18);
		if (line.operand == "") out << std::left << "-";
		else out << std::left << line.operand << "\n";
		return out;
	}
	friend class SymbolReader;
};

void 	buildOptab(std::vector<OpInfo>& optab);
void	readSrcFile(std::vector<Line>& vec);

#endif
