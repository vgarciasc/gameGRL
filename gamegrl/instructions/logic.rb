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

            def reset_flags
                @f = 0x00
            end

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
        end
    end
end