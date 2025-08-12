-- blah!
-- words = {}
-- for word in io.read():gmatch('%S+') do
--     table.insert(words, word)
-- end
--
-- for _, word in pairs(words) do
--     local new_word = ""
--     for i=1, #word do
--         if i % 2 == 0 then
--             new_word = new_word
--         end
--
--     end
-- end

-- double blah
-- print((io.read():gsub('(%w)(%w)', function(a,b) return a .. string.char(b:byte()+1)end)))

print((io.read():gsub('.', { ['A'] = 'V', ['E'] = 'X', ['O'] = 'X', ['U'] = 'V' })))
