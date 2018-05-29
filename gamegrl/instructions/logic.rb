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

            #TODO: HL acessa memória
            def add_a_hl
                reset_flags
                result = @a + @b

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #TODO: nn está na pilha
            def add_a_nn
                reset_flags
                result = @a + @b

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #ADC A, B
            #A <- A + B + (1 se CARRY_FLAG == 1)
            def adc_a_b
                reset_flags
                result = @a + @b + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_a
                reset_flags
                result = @a + @a + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_c
                reset_flags
                result = @a + @c + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_d
                reset_flags
                result = @a + @d + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_e
                reset_flags
                result = @a + @e + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_h
                reset_flags
                result = @a + @h + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            def adc_a_l
                reset_flags
                result = @a + @l + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #TODO
            def adc_a_hl
                reset_flags
                result = @a + @l + get_c_flag_as_hex

                result > 0x0F         ? set_hc_flag : 0
                result > 0xFF         ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @a = result & 0xFF
            end

            #TODO
            def adc_a_nn
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

            #TODO
            def sub_hl
                reset_flags
                result = @a - @c

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            #TODO
            def sub_nn
                reset_flags
                result = @a - @c

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

            #TODO
            def sbc_a_hl
                reset_flags
                result = @a - @hl - get_c_flag_as_hex

                (@a ^ @hl ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @hl ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag

                @a = result & 0xFF
            end

            #TODO
            def sbc_a_nn
                reset_flags
                result = @a - @nn - get_c_flag_as_hex

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
            
            #TODO
            def and_hl
                reset_flags
                result = @a & @b
                
                set_hc_flag
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            #TODO
            def and_nn
                reset_flags
                result = @a & @b
                
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
            
            #TODO
            def or_hl
                reset_flags
                result = @a | @b
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            #TODO
            def or_nn
                reset_flags
                result = @a | @b
                
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
            
            #TODO
            def xor_hl
                reset_flags
                result = @a ^ @b
                
                result == 0x00 ? set_z_flag : 0

                @a = result & 0xFF
            end
            
            #TODO
            def xor_nn
                reset_flags
                result = @a ^ @b
                
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

            #TODO
            def cp_hl
                reset_flags
                result = @a - @c

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0
                set_s_flag
            end

            #TODO
            def cp_nn
                reset_flags
                result = @a - @c

                (@a ^ @c ^ result) & 0x010 == 0x010  ? set_hc_flag : 0
                (@a ^ @c ^ result) & 0x100 == 0x100  ? set_c_flag  : 0
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

            #TODO 
            def inc_hl
                reset_flags
                result = @b + 1

                result > 0x0F         ? set_hc_flag : 0
                result & 0xFF == 0x00 ? set_z_flag  : 0

                @b = result & 0xFF
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
            
            #TODO
            def dec_hl
                reset_flags
                value = mmu.read_byte(self.hl)
                result = value - 1

                (value ^ 0x01 ^ result) & 0x10 == 0x10  ? set_hc_flag : 0
                result & 0xFF == 0x00                   ? set_z_flag  : 0
                set_s_flag

                mmu.write_byte(result & 0xFF)
            end

            #======================================
            #16-BIT ARITHMETIC AND LOGIC OPERATIONS
            #======================================
        end
    end
end