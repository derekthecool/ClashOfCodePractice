local function dna_math()
    print((io.read():gsub('.', { A = 'AA', T = 'TTT', G = '' })))
end
