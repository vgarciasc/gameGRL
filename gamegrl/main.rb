require "./cpu"
require "./instructions/logic"

cpu = GameGRL::CPU.new
cpu.add_a_b
cpu.print_registers
cpu.print_flags