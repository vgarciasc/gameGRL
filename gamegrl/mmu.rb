module GameGRL
    class MMU
        def read_byte(position)
            puts("byte read!")
        end
        
        def write_byte(position, value)
            puts("byte written!")
        end

        def read_word(position)
            puts("word read!")
        end
        
        def write_word(position, value)
            puts("word written!")
        end
    end
end