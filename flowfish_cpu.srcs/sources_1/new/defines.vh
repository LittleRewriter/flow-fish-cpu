`define RstEnable       1'b1
`define RstDisable      1'b0
`define ZeroWord        32'h00000000
`define WriteEnable     1'b1
`define WriteDisable    1'b0
`define ReadEnable      1'b1
`define ReadDisable     1'b0
`define AluOpBus        7:0
`define AluSelBus       2:0
`define InstValid       1'b0
`define InstInvalid     1'b1
`define True_v          1'b1
`define False_v         1'b0
`define ChipEnable      1'b1
`define ChipDisable     1'b0

// instruction code
`define EXE_ORI         6'b001101
`define EXE_ANDI        6'b001100
`define EXE_XORI        6'b001110
`define EXE_LUI         6'b001111
`define EXE_PREF        6'b110011
`define EXE_NOP         6'b000000
`define EXE_SPECIAL     6'b000000
`define EXE_SPECIAL2    6'b011100
`define EXE_REGIMM      6'b000001
`define EXE_ADDI        6'b001000
`define EXE_ADDIU       6'b001001
`define EXE_SLTI        6'b001010
`define EXE_LW          6'b100011
`define EXE_SW          6'b101011
`define EXE_J           6'b000010
`define EXE_BEQ         6'b000100
// function code, for inst_code is 6'b000000
`define FUNC_AND        6'b100100
`define FUNC_OR         6'b100101
`define FUNC_XOR        6'b100110
`define FUNC_NOR        6'b100111
`define FUNC_SLL        6'b000000
`define FUNC_SRL        6'b000010
`define FUNC_SRA        6'b000011
`define FUNC_SYNC       6'b001111
`define FUNC_MOVZ       6'b001010
`define FUNC_MOVN       6'b001011
`define FUNC_MFHI       6'b010000
`define FUNC_MFLO       6'b010010
`define FUNC_MTHI       6'b010001
`define FUNC_MTLO       6'b010011
`define FUNC_ADD        6'b100000
`define FUNC_ADDU       6'b100001
`define FUNC_SUB        6'b100010
`define FUNC_SUBU       6'b100011
`define FUNC_SLT        6'b101010
`define FUNC_SLTU       6'b101011
// Alu operators
`define EXE_OR_OP       8'b00100101
`define EXE_AND_OP      8'b00100100
`define EXE_XOR_OP      8'b00100110
`define EXE_NOR_OP      8'b00100111
`define EXE_NOP_OP      8'b00000000
`define EXE_SLL_OP      8'b00000000
`define EXE_SRL_OP      8'b00000010
`define EXE_SRA_OP      8'b00000011
// Alu sel
`define EXE_RES_LOGIC   3'b001
`define EXE_RES_MOV     3'b011
`define EXE_RES_SHIFT   3'b000
`define EXE_RES_NOP     3'b000
`define EXE_RES_ARITHMETIC 3'b100
`define EXE_RES_JUMP_BRANCH 3'b101
`define EXE_RES_LOAD_STORE 3'b110

// Storage related
`define InstAddrBus     31:0
`define InstBus         31:0
`define InstMemNum      1023
`define InstMemNumLog2  10
`define DataAddrBus     31:0
`define DataBus         31:0
`define DataMemNum      1048575
`define DataMemNumLog2  20

// Regfile related
`define RegAddrBus      4:0
`define RegBus          31:0
`define RegWidth        32
`define DoubleRegWidth  64
`define DoubleRegBus    63:0
`define RegNum          32
`define RegNumLog2      5
`define NOPRegAddr      5'b00000