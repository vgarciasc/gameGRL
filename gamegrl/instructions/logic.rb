module GameGRL
    module Instructions
        module Logic
            def set_z_flag
                @f |= Z_FLAG
            end
            
            def set_s_flag
                @f |= S_FLAG
            end
            
            def set_hc_flag
                @f |= HC_FLAG
            end
            
            def set_c_flag
                @f |= C_FLAG
            end

            def get_c_flag_as_hex
                @f & C_FLAG == 0x00 ? 0x00 : 0x01
            end

            def reset_flags
                @f = 0x00
            end

            def n
                $mmu.read_byte(@pc)
            end

            def nn
                $mmu.read_word(@pc)
            end

            #=====================================
            #8-BIT ARITHMETIC AND LOGIC OPERATIONS
            #=====================================

            #ADD A, B
            #A <- A + B
            def add_a_b
                reset_flags
                result = @a + @b

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_a
                reset_flags
                result = @a + @a

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_c
                reset_flags
                result = @a + @c

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_d
                reset_flags
                result = @a + @d

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @d = result & 0xFF
            end

            def add_a_e
                reset_flags
                result = @a + @e

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @e = result & 0xFF
            end

            def add_a_h
                reset_flags
                result = @a + @h

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_l
                reset_flags
                result = @a + @l

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a + value

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def add_a_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a + value

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #ADC A, B
            #A <- A + B + (1 se CARRY_FLAG == 1)
            def adc_a_b
                result = @a + @b + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_a
                result = @a + @a + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_c
                result = @a + @c + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_d
                result = @a + @d + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_e
                result = @a + @e + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_h
                result = @a + @h + get_c_flag_as_hex
                reset_flags
                
                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_l
                result = @a + @l + get_c_flag_as_hex
                reset_flags

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_hl
                value = $mmu.read_byte self.hl
                reset_flags
                result = @a + value + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_nn
                value = $mmu.read_byte @pc
                reset_flags
                result = @a + @l + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #SUB B
            #A <- A - B
            def sub_b
                reset_flags
                result = @a - @b

                (@a ^ @b ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @b ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_a
                reset_flags
                result = @a - @a

                (@a ^ @a ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @a ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_c
                reset_flags
                result = @a - @c

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_d
                reset_flags
                result = @a - @d

                (@a ^ @d ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @d ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_e
                reset_flags
                result = @a - @e

                (@a ^ @e ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @e ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_h
                reset_flags
                result = @a - @h

                (@a ^ @h ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @h ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_l
                reset_flags
                result = @a - @l

                (@a ^ @l ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @l ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a - value

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sub_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a - value

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            #SBC A, B
            #A <- A - B - (1 se CARRY_FLAG == 1)
            def sbc_a_b
                reset_flags
                result = @a - @b - get_c_flag_as_hex

                (@a ^ @b ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @b ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_a
                reset_flags
                result = @a - @a - get_c_flag_as_hex

                (@a ^ @a ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @a ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_c
                reset_flags
                result = @a - @c - get_c_flag_as_hex

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_d
                reset_flags
                result = @a - @d - get_c_flag_as_hex

                (@a ^ @d ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @d ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_e
                reset_flags
                result = @a - @e - get_c_flag_as_hex

                (@a ^ @e ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @e ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_h
                reset_flags
                result = @a - @h - get_c_flag_as_hex

                (@a ^ @h ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @h ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_l
                reset_flags
                result = @a - @l - get_c_flag_as_hex

                (@a ^ @l ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @l ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a - value - get_c_flag_as_hex

                (@a ^ @hl ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @hl ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            def sbc_a_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a - value - get_c_flag_as_hex

                (@a ^ @nn ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @nn ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            #AND B
            #A <- A & B
            def and_b
                reset_flags
                result = @a & @b
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_a
                reset_flags
                result = @a & @a
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_c
                reset_flags
                result = @a & @c
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_d
                reset_flags
                result = @a & @d
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_e
                reset_flags
                result = @a & @e
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_h
                reset_flags
                result = @a & @h
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_l
                reset_flags
                result = @a & @l
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a & value
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def and_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a & value
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end

            #OR B
            #A <- A | B
            def or_b
                reset_flags
                result = @a | @b
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_a
                reset_flags
                result = @a | @a
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_c
                reset_flags
                result = @a | @c
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_d
                reset_flags
                result = @a | @d
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_e
                reset_flags
                result = @a | @e
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_h
                reset_flags
                result = @a | @h
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_l
                reset_flags
                result = @a | @l
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a | value
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def or_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a | value
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end

            #XOR B
            #A <- A ^ B
            def xor_b
                reset_flags
                result = @a ^ @b
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_a
                reset_flags
                result = @a ^ @a
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_c
                reset_flags
                result = @a ^ @c
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_d
                reset_flags
                result = @a ^ @d
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_e
                reset_flags
                result = @a ^ @e
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_h
                reset_flags
                result = @a ^ @h
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_l
                reset_flags
                result = @a ^ @l
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a ^ value
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            def xor_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a ^ value
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end

            #CP B
            #A - B
            def cp_b
                reset_flags
                result = @a - @b

                (@a ^ @b ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @b ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_a
                reset_flags
                result = @a - @a

                (@a ^ @a ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @a ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_c
                reset_flags
                result = @a - @c

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_d
                reset_flags
                result = @a - @d

                (@a ^ @d ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @d ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_e
                reset_flags
                result = @a - @e

                (@a ^ @e ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @e ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_h
                reset_flags
                result = @a - @h

                (@a ^ @h ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @h ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_l
                reset_flags
                result = @a - @l

                (@a ^ @l ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @l ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_hl
                reset_flags
                value = $mmu.read_byte self.hl
                result = @a - value

                (@a ^ value ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ value ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            def cp_nn
                reset_flags
                value = $mmu.read_byte @pc
                result = @a - value

                (@a ^ value ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ value ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            #INC B
            #B <- B + 1
            def inc_b
                reset_flags
                result = @b + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @b = result & 0xFF
            end

            def inc_a
                reset_flags
                result = @a + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def inc_c
                reset_flags
                result = @c + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @c = result & 0xFF
            end

            def inc_d
                reset_flags
                result = @d + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @d = result & 0xFF
            end

            def inc_e
                reset_flags
                result = @e + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @e = result & 0xFF
            end

            def inc_h
                reset_flags
                result = @h + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @h = result & 0xFF
            end

            def inc_l
                reset_flags
                result = @l + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @l = result & 0xFF
            end

            def inc_hl_pointer
                reset_flags
                value = $mmu.read_byte(self.hl)
                result = value + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                $mmu.write_byte(self.hl, result & 0xFFFF)
            end

            #DEC B
            #B <- B - 1
            def dec_b
                reset_flags
                result = @b - 1

                (@b ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @b = result & 0xFF
            end
            
            def dec_a
                reset_flags
                result = @a - 1

                (@a ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end
            
            def dec_c
                reset_flags
                result = @b - 1

                (@b ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end
            
            def dec_b
                reset_flags
                result = @b - 1

                (@b ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end
            
            def dec_c
                reset_flags
                result = @c - 1

                (@c ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @c = result & 0xFF
            end
            
            def dec_d
                reset_flags
                result = @d - 1

                (@d ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @d = result & 0xFF
            end
            
            def dec_e
                reset_flags
                result = @e - 1

                (@e ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @e = result & 0xFF
            end
            
            def dec_h
                reset_flags
                result = @h - 1

                (@h ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @h = result & 0xFF
            end
            
            def dec_l
                reset_flags
                result = @l - 1

                (@l ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                ? set_z_flag  : 0
                set_s_flag

                @l = result & 0xFF
            end
            
            def dec_hl_pointer
                reset_flags
                value = $mmu.read_byte(self.hl)
                result = value - 1

                (value ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                   ? set_z_flag  : 0
                set_s_flag
                
                $mmu.write_byte(self.hl, result & 0xFFFF)
            end

            #======================================
            #16-BIT ARITHMETIC AND LOGIC OPERATIONS
            #======================================

            def add_hl_bc
                reset_flags
                result = self.hl + self.bc 

                (self.hl ^ self.bc ^ (result & 0xFFFF)) & 0x1000 == 0x1000 ? set_hc_flag : 0
                result & 0x10000 == 0x10000 ? set_c_flag : 0

                self.hl = result & 0xFFFF
            end

            def add_hl_de
                reset_flags
                result = self.hl + self.de 

                (self.hl ^ self.de ^ (result & 0xFFFF)) & 0x1000 == 0x1000 ? set_hc_flag : 0
                result & 0x10000 == 0x10000 ? set_c_flag : 0

                self.hl = result & 0xFFFF
            end

            def add_hl_hl
                reset_flags
                result = self.hl + self.hl 

                (self.hl ^ self.hl ^ (result & 0xFFFF)) & 0x1000 == 0x1000 ? set_hc_flag : 0
                result & 0x10000 == 0x10000 ? set_c_flag : 0

                self.hl = result & 0xFFFF
            end

            def add_hl_sp
                reset_flags
                result = self.hl + @sp 

                (self.hl ^ @sp ^ (result & 0xFFFF)) & 0x1000 == 0x1000 ? set_hc_flag : 0
                result & 0x10000 == 0x10000 ? set_c_flag : 0

                self.hl = result & 0xFFFF
            end

            def add_sp_nn
                reset_flags
                value = $mmu.read_byte @pc

                result = @sp + value
                (@sp ^ val ^ (result & 0xFFFF)) & 0x100 == 0x100 ? set_c_flag : reset_c_flag
                (@sp ^ val ^ (result & 0xFFFF)) & 0x10 == 0x10 ? set_h_flag : reset_h_flag
        
                @sp = result & 0xFFFF
            end
            
            def inc_bc
                self.bc = (self.bc + 1) & 0xFF
            end
            
            def inc_de
                self.de = (self.de + 1) & 0xFF
            end
            
            def inc_hl
                self.hl = (self.hl + 1) & 0xFF
            end
            
            def inc_sp
                @sp = (@sp + 1) & 0xFF
            end
            
            def dec_bc
                self.bc = (self.bc - 1) & 0xFF
            end
            
            def dec_de
                self.de = (self.de - 1) & 0xFF
            end
            
            def dec_hl
                self.hl = (self.hl - 1) & 0xFF
            end
            
            def dec_sp
                @sp = (@sp - 1) & 0xFF
            end

            #=====================
            #8-BIT LOAD OPERATIONS
            #=====================

            def ld_a_n
                @a = $mmu.read_byte @pc
            end

            def ld_b_n
                @b = $mmu.read_byte @pc
            end
            
            def ld_c_n
                @c = $mmu.read_byte @pc
            end
            
            def ld_d_n
                @d = $mmu.read_byte @pc
            end
            
            def ld_e_n
                @e = $mmu.read_byte @pc
            end
            
            def ld_h_n
                @h = $mmu.read_byte @pc
            end
            
            def ld_l_n
                @l = $mmu.read_byte @pc
            end
            
            def ld_a_a
                @a = @a
            end
            
            def ld_a_b
                @a = @b
            end
            
            def ld_a_c
                @a = @c
            end
            
            def ld_a_d
                @a = @d
            end
            
            def ld_a_e
                @a = @e
            end
            
            def ld_a_h
                @a = @h
            end
            
            def ld_a_l
                @a = @l
            end
            
            def ld_a_hl
                val = $mmu.read_byte self.hl
                @a = val
            end
            
            def ld_b_a
                @b = @a
            end
            
            def ld_b_b
                @b = @b
            end
            
            def ld_b_c
                @b = @c
            end
            
            def ld_b_d
                @b = @d
            end
            
            def ld_b_e
                @b = @e
            end
            
            def ld_b_h
                @b = @h
            end
            
            def ld_b_l
                @b = @l
            end
            
            def ld_b_hl
                val = $mmu.read_byte self.hl
                @b = val
            end
            
            def ld_c_a
                @c = @a
            end
            
            def ld_c_b
                @c = @b
            end
            
            def ld_c_c
                @c = @c
            end
            
            def ld_c_d
                @c = @d
            end
            
            def ld_c_e
                @c = @e
            end
            
            def ld_c_h
                @c = @h
            end
            
            def ld_c_l
                @c = @l
            end
            
            def ld_c_hl
                val = $mmu.read_byte self.hl
                @c = val
            end
            
            def ld_d_a
                @d = @a
            end
            
            def ld_d_b
                @d = @b
            end
            
            def ld_d_c
                @d = @c
            end
            
            def ld_d_d
                @d = @d
            end
            
            def ld_d_e
                @d = @e
            end
            
            def ld_d_h
                @d = @h
            end
            
            def ld_d_l
                @d = @l
            end
            
            def ld_d_hl
                val = $mmu.read_byte self.hl
                @d = val
            end
            
            def ld_e_a
                @e = @a
            end
            
            def ld_e_b
                @e = @b
            end
            
            def ld_e_c
                @e = @c
            end
            
            def ld_e_d
                @e = @d
            end
            
            def ld_e_e
                @e = @e
            end
            
            def ld_e_h
                @e = @h
            end
            
            def ld_e_l
                @e = @l
            end
            
            def ld_e_hl
                val = $mmu.read_byte self.hl
                @c = val
            end
            
            def ld_h_a
                @h = @a
            end
            
            def ld_h_b
                @h = @b
            end
            
            def ld_h_c
                @h = @c
            end
            
            def ld_h_d
                @h = @d
            end
            
            def ld_h_e
                @h = @e
            end
            
            def ld_h_h
                @h = @h
            end
            
            def ld_h_l
                @h = @l
            end
            
            def ld_h_hl
                val = $mmu.read_byte self.hl
                @h = val
            end
            
            def ld_l_a
                @l = @a
            end
            
            def ld_l_b
                @l = @b
            end
            
            def ld_l_c
                @l = @c
            end
            
            def ld_l_d
                @l = @d
            end
            
            def ld_l_e
                @l = @e
            end
            
            def ld_l_h
                @l = @h
            end
            
            def ld_l_l
                @l = @l
            end
            
            def ld_l_hl
                val = $mmu.read_byte self.hl
                @l = val
            end
            
            def ld_hl_a
                $mmu.write_byte(self.hl, @a)
            end
            
            def ld_hl_b
                $mmu.write_byte(self.hl, @b)
            end
            
            def ld_hl_c
                $mmu.write_byte(self.hl, @c)
            end
            
            def ld_hl_d
                $mmu.write_byte(self.hl, @d)
            end
            
            def ld_hl_e
                $mmu.write_byte(self.hl, @e)
            end
            
            def ld_hl_h
                $mmu.write_byte(self.hl, @h)
            end
            
            def ld_hl_l
                $mmu.write_byte(self.hl, @l)
            end
            
            def ld_hl_n
                val = $mmu.read_byte @pc
                $mmu.write_byte(self.hl, val)
            end

            def ld_a_bc_pointer
                @a = $mmu.read_byte self.bc
            end

            def ld_a_de_pointer
                @a = $mmu.read_byte self.de
            end

            def ld_a_nn_pointer
                @a = $mmu.read_byte($mmu.read_word(@pc))
            end

            def ld_bc_pointer_a
                $mmu.write_byte(self.bc, @a)
            end

            def ld_de_pointer_a
                $mmu.write_byte(self.de, @a)
            end

            def ld_hl_pointer_a
                $mmu.write_byte(self.hl, @a)
            end

            def ld_nn_pointer_a
                $mmu.write_byte($mmu.read_word(@pc), @a)
            end

            def ld_a_ff00c
                addr = (0xFF00 + @c) & 0xFFFF
                @a = $mmu.read_byte(addr)
            end

            def ld_ff00c_a
                addr = (0xFF00 + @c) & 0xFFFF
                $mmu.write_byte(addr, @a)
            end

            def ldd_a_hl
                ld_a_hl
                self.hl = (self.hl - 1) & 0xFFFF
            end

            def ldi_a_hl
                ld_a_hl
                self.hl = (self.hl + 1) & 0xFFFF
            end

            def ldd_hl_a
                ld_hl_a
                self.hl = (self.hl - 1) & 0xFFFF
            end

            def ldi_hl_a
                ld_hl_a
                self.hl = (self.hl + 1) & 0xFFFF
            end

            def ldh_n_a
                $mmu.write_byte((0xFF00 + n) & 0xFFFF, @a)
            end

            def ldh_n_a
                @a = $mmu.read_byte((0xFF00 + n) & 0xFFFF)
            end

            #======================
            #16-BIT LOAD OPERATIONS
            #======================

            def ld_bc_nn
                self.bc = nn
            end

            def ld_de_nn
                self.de = nn
            end

            def ld_hl_nn
                self.hl = nn
            end

            def ld_sp_nn
                @sp = nn
            end

            def ld_sp_hl
                @sp = hl
            end

            def ldhl_sp_n
                self.hl = @sp + n
            end

            def ld_nn_pointer_sp
                $mmu.write_byte(nn, @sp)
            end

            def push_onto_stack(val, word = true)
                if word
                    upper = (val >> 8) & 0xFF
                    lower = val & 0xFF

                    @sp -= 1
                    $mmu.write_byte @sp, upper
                    @sp -= 1
                    $mmu.write_byte @sp, lower 
                else
                    @sp -= 1
                    $mmu.write_byte @sp, val 
                end
            end

            def push_af
                push_onto_stack self.af
            end

            def push_bc
                push_onto_stack self.bc
            end

            def push_de
                push_onto_stack self.de
            end

            def push_hl
                push_onto_stack self.hl
            end

            def pop_from_stack(word = true)
                if word
                    lower = $mmu.read_byte @sp
                    @sp += 1
                    upper = $mmu.read_byte @sp
                    @sp += 1

                    (upper << 8) | lower
                else
                    val = $mmu.read_byte @sp
                    @sp += 1
                    val
                end
            end

            def pop_af
                self.af = pop_from_stack
            end

            def pop_bc
                self.bc = pop_from_stack
            end

            def pop_de
                self.de = pop_from_stack
            end

            def pop_hl
                self.hl = pop_from_stack
            end
        end
    end
end