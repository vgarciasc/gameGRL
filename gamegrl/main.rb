require "./cpu"
require "./mmu"
require "./instructions/logic"

$mmu = GameGRL::MMU.new
cpu = GameGRL::CPU.new
cpu.sub_hl
cpu.print_registers
cpu.print_flags