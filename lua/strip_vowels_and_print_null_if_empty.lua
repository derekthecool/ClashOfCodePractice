local function strip_vowels_and_print_null_if_empty()
    o = io.read():upper():gsub('[AEIOUY]', '')
    if o:match('^%s+$') or #o <= 0 then
        print('null')
    else
        print(o)
    end
end
