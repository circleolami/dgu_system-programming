def parse_line(line):
    if line[0].isspace():
        label = None
        parts = line.strip().split(maxsplit=1)
        opcode = parts[0] if parts else None
        operand = parts[1] if len(parts) > 1 else None
    else:
        parts = line.strip().split(maxsplit=2)
        label = parts[0] if parts else None
        opcode = parts[1] if len(parts) > 1 else None
        operand = parts[2] if len(parts) > 2 else None
    return label, opcode, operand


def sic_to_intfile(srcfile, intfile):
    with open(srcfile, 'r') as sf, open(intfile, 'w') as intf:
        for line in sf:
            label, opcode, operand = parse_line(line)
            intf.write(
                f"LABEL : {label or ''}\tOPCODE : {opcode or ''}\tOPERAND : {operand or ''}\n")


sic_to_intfile("SRCFILE.txt", "Intfile.txt")
