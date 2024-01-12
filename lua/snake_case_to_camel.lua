local function snake_case_to_camel()
    print((io.read():gsub('_(%w)', function(x)return x:upper()end):gsub('_$', '')))
end
