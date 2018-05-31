require "./instructions/logic"

module GameGRL
    #Flag ZERO, ativa se última instrução resultou em 0x00
    Z_FLAG  = 0x80
    #Flag SUB, ativa se última instrução foi uma subtraçãoc
    S_FLAG  = 0x40
    #Flag HALF-CARRY, ativa se última instrução ultrapassou a parte baixa do byte (maior que 0x0F)
    HC_FLAG = 0x20
    #Flag CARRY, ativa se última instrução ultrapassou o valor do byte (maior que 0xFF)
    C_FLAG  = 0x10

    class CPU
        include Instructions::Logic

        # Registradores de 8 bits
        attr_reader :a, :b, :c, :d, :e, :f, :h, :l
        # Registradores de 16 bits
        attr_reader :sp, :pc
        # Clock de instruções da CPU
        attr_reader :m

        def initialize
            @a = @b = @c = @d = @e = @f = @h = @l = @f = 0x00
            @pc = @sp = 0x0000
            @m = 0
        end

        def af
            (@a << 8) | @f
        end

        def af=(value)
            @a = (value >> 8) & 0xFF
            @f = value & 0xFF
        end

        def bc
            (@b << 8) | @c
        end

        def bc=(value)
            @b = (value >> 8) & 0xFF
            @c = value & 0xFF
        end

        def de
            (@d << 8) | @e
        end

        def de=(value)
            @d = (value >> 8) & 0xFF
            @e = value & 0xFF
        end

        def hl
            (@h << 8) | @l
        end

        def hl=(value)
            @h = (value >> 8) & 0xFF
            @l = value & 0xFF
        end

        def print_registers
            puts("registers: \n[\n\ta: 0x" + @a.to_s(16).upcase.ljust(2, '0') + 
                "\n\tb: 0x" + @b.to_s(16).upcase.ljust(2, '0') + 
                "\n\tc: 0x" + @c.to_s(16).upcase.ljust(2, '0') + 
                "\n\td: 0x" + @d.to_s(16).upcase.ljust(2, '0') + 
                "\n\te: 0x" + @e.to_s(16).upcase.ljust(2, '0') + 
                "\n\tf: 0x" + @f.to_s(16).upcase.ljust(2, '0') + 
                "\n\th: 0x" + @h.to_s(16).upcase.ljust(2, '0') + 
                "\n\tl: 0x" + @l.to_s(16).upcase.ljust(2, '0') + "\n]")
        end

        def print_flags
            puts("flags: [" + "f: " + @f.to_s(2).upcase.ljust(2, '0') + "]")
            puts("Z:  " + (!(@f & 0x80 == 0x00) ? 1 : 0).to_s)
            puts("S:  " + (!(@f & 0x40 == 0x00) ? 1 : 0).to_s)
            puts("HC: " + (!(@f & 0x20 == 0x00) ? 1 : 0).to_s)
            puts("C:  " + (!(@f & 0x10 == 0x00) ? 1 : 0).to_s)
        end
    end
end