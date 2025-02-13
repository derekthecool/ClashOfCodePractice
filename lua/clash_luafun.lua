---@diagnostic disable: undefined-global
-- Lua fun library https://github.com/luafun/luafun/blob/master/fun.lua
-- Documentation: https://luafun.github.io/
-- Minified by 50% by https://mothereff.in/lua-minifier
local a = {}
local b = {}
local unpack = rawget(table, 'unpack') or unpack
local c = function(d, ...)
    if d == nil then
        return nil
    end
    return ...
end
local e = function(f, d, ...)
    if d == nil then
        return nil
    end
    return d, f(...)
end
local function g(h)
    local i = type(h)
    local j
    if i == 'table' then
        j = {}
        for k, l in next, h, nil do
            j[g(k)] = g(l)
        end
    else
        j = h
    end
    return j
end
local m = {
    __call = function(self, n, o)
        return self.gen(n, o)
    end,
    __tostring = function(self)
        return '<generator>'
    end,
    __index = b,
}
local p = function(q, n, o)
    return setmetatable({ gen = q, param = n, state = o }, m), n, o
end
a.wrap = p
local r = function(self)
    return self.gen, self.param, self.state
end
b.unwrap = r
local s = function(t, u)
    return nil
end
local v = function(n, o)
    local o = o + 1
    if o > #n then
        return nil
    end
    local w = string.sub(n, o, o)
    return o, w
end
local x = ipairs({})
local y = pairs({ a = 0 })
local z = function(A, B)
    local C
    local B, C = y(A, B)
    return B, B, C
end
local D = function(E, n, o)
    assert(E ~= nil, 'invalid iterator')
    if type(E) == 'table' then
        local F = getmetatable(E)
        if F ~= nil then
            if F == m then
                return E.gen, E.param, E.state
            elseif F.__ipairs ~= nil then
                return F.__ipairs(E)
            elseif F.__pairs ~= nil then
                return F.__pairs(E)
            end
        end
        if #E > 0 then
            return ipairs(E)
        else
            return z, E, nil
        end
    elseif type(E) == 'function' then
        return E, n, o
    elseif type(E) == 'string' then
        if #E == 0 then
            return s, nil, nil
        end
        return v, E, 0
    end
    error(string.format('object %s of type "%s" is not iterable', E, type(E)))
end
local G = function(E, n, o)
    return p(D(E, n, o))
end
a.iter = G
local H = function(f)
    return function(self)
        return f(self.gen, self.param, self.state)
    end
end
local I = function(f)
    return function(self, J)
        return f(J, self.gen, self.param, self.state)
    end
end
local K = function(f)
    return function(self, J, L)
        return f(J, L, self.gen, self.param, self.state)
    end
end
local M = function(f)
    return function(q, n, o)
        return f(D(q, n, o))
    end
end
local N = function(f)
    return function(J, q, n, o)
        return f(J, D(q, n, o))
    end
end
local O = function(f)
    return function(J, L, q, n, o)
        return f(J, L, D(q, n, o))
    end
end
local P = function(f, q, n, o)
    repeat
        o = e(f, q(n, o))
    until o == nil
end
b.each = I(P)
a.each = N(P)
b.for_each = b.each
a.for_each = a.each
b.foreach = b.each
a.foreach = a.each
local Q = function(n, o)
    local R, S = n[1], n[2]
    local o = o + S
    if o > R then
        return nil
    end
    return o, o
end
local T = function(n, o)
    local R, S = n[1], n[2]
    local o = o + S
    if o < R then
        return nil
    end
    return o, o
end
local U = function(V, R, S)
    if S == nil then
        if R == nil then
            if V == 0 then
                return s, nil, nil
            end
            R = V
            V = R > 0 and 1 or -1
        end
        S = V <= R and 1 or -1
    end
    assert(type(V) == 'number', 'start must be a number')
    assert(type(R) == 'number', 'stop must be a number')
    assert(type(S) == 'number', 'step must be a number')
    assert(S ~= 0, 'step must not be zero')
    if S > 0 then
        return p(Q, { R, S }, V - S)
    elseif S < 0 then
        return p(T, { R, S }, V - S)
    end
end
a.range = U
local W = function(X, d)
    return d + 1, unpack(X)
end
local Y = function(X, d)
    return d + 1, X(d)
end
local Z = function(X, d)
    return d + 1, X
end
local _ = function(...)
    if select('#', ...) <= 1 then
        return p(Z, select(1, ...), 0)
    else
        return p(W, { ... }, 0)
    end
end
a.duplicate = _
a.replicate = _
a.xrepeat = _
local a0 = function(f)
    assert(type(f) == 'function')
    return p(Y, f, 0)
end
a.tabulate = a0
local a1 = function()
    return p(Z, 0, 0)
end
a.zeros = a1
local a2 = function()
    return p(Z, 1, 0)
end
a.ones = a2
local a3 = function(X, a4)
    return 0, math.random(X[1], X[2])
end
local a5 = function(a6, a4)
    return 0, math.random()
end
local a7 = function(a8, a9)
    if a8 == nil and a9 == nil then
        return p(a5, 0, 0)
    end
    assert(type(a8) == 'number', 'invalid first arg to rands')
    if a9 == nil then
        a9 = a8
        a8 = 0
    else
        assert(type(a9) == 'number', 'invalid second arg to rands')
    end
    assert(a8 < a9, 'empty interval')
    return p(a3, { a8, a9 - 1 }, 0)
end
a.rands = a7
local aa = function(a8, ab, X, d)
    assert(a8 > 0, 'invalid first argument to nth')
    if ab == x then
        return X[a8]
    elseif ab == v then
        if a8 <= #X then
            return string.sub(X, a8, a8)
        else
            return nil
        end
    end
    for ac = 1, a8 - 1, 1 do
        d = ab(X, d)
        if d == nil then
            return nil
        end
    end
    return c(ab(X, d))
end
b.nth = I(aa)
a.nth = N(aa)
local ad = function(o, ...)
    if o == nil then
        error('head: iterator is empty')
    end
    return ...
end
local ae = function(q, n, o)
    return ad(q(n, o))
end
b.head = H(ae)
a.head = M(ae)
a.car = a.head
b.car = b.head
local af = function(q, n, o)
    o = q(n, o)
    if o == nil then
        return p(s, nil, nil)
    end
    return p(q, n, o)
end
b.tail = H(af)
a.tail = M(af)
a.cdr = a.tail
b.cdr = b.tail
local ag = function(ac, d, ...)
    if d == nil then
        return nil
    end
    return { ac, d }, ...
end
local ah = function(n, o)
    local a8, ab, X = n[1], n[2], n[3]
    local ac, d = o[1], o[2]
    if ac >= a8 then
        return nil
    end
    return ag(ac + 1, ab(X, d))
end
local ai = function(a8, q, n, o)
    assert(a8 >= 0, 'invalid first argument to take_n')
    return p(ah, { a8, q, n }, { 0, o })
end
b.take_n = I(ai)
a.take_n = N(ai)
local aj = function(f, d, ...)
    if d == nil or not f(...) then
        return nil
    end
    return d, ...
end
local ak = function(n, d)
    local f, ab, X = n[1], n[2], n[3]
    return aj(f, ab(X, d))
end
local al = function(f, q, n, o)
    assert(type(f) == 'function', 'invalid first argument to take_while')
    return p(ak, { f, q, n }, o)
end
b.take_while = I(al)
a.take_while = N(al)
local am = function(an, q, n, o)
    if type(an) == 'number' then
        return ai(an, q, n, o)
    else
        return al(an, q, n, o)
    end
end
b.take = I(am)
a.take = N(am)
local ao = function(a8, q, n, o)
    assert(a8 >= 0, 'invalid first argument to drop_n')
    local ac
    for ac = 1, a8, 1 do
        o = q(n, o)
        if o == nil then
            return p(s, nil, nil)
        end
    end
    return p(q, n, o)
end
b.drop_n = I(ao)
a.drop_n = N(ao)
local ap = function(f, d, ...)
    if d == nil or not f(...) then
        return d, false
    end
    return d, true, ...
end
local aq = function(f, ab, X, d)
    assert(type(f) == 'function', 'invalid first argument to drop_while')
    local ar, as
    repeat
        as = g(d)
        d, ar = ap(f, ab(X, d))
    until not ar
    if d == nil then
        return p(s, nil, nil)
    end
    return p(ab, X, as)
end
b.drop_while = I(aq)
a.drop_while = N(aq)
local at = function(an, ab, X, d)
    if type(an) == 'number' then
        return ao(an, ab, X, d)
    else
        return aq(an, ab, X, d)
    end
end
b.drop = I(at)
a.drop = N(at)
local au = function(an, ab, X, d)
    return am(an, ab, X, d), at(an, ab, X, d)
end
b.split = I(au)
a.split = N(au)
b.split_at = b.split
a.split_at = a.split
b.span = b.split
a.span = a.split
local av = function(aw, q, n, o)
    local ac = 1
    for ax, w in q, n, o do
        if w == aw then
            return ac
        end
        ac = ac + 1
    end
    return nil
end
b.index = I(av)
a.index = N(av)
b.index_of = b.index
a.index_of = a.index
b.elem_index = b.index
a.elem_index = a.index
local ay = function(n, o)
    local aw, ab, X = n[1], n[2], n[3]
    local ac, d = o[1], o[2]
    local w
    while true do
        d, w = ab(X, d)
        if d == nil then
            return nil
        end
        ac = ac + 1
        if w == aw then
            return { ac, d }, ac
        end
    end
end
local az = function(aw, q, n, o)
    return p(ay, { aw, q, n }, { 0, o })
end
b.indexes = I(az)
a.indexes = N(az)
b.elem_indexes = b.indexes
a.elem_indexes = a.indexes
b.indices = b.indexes
a.indices = a.indexes
b.elem_indices = b.indexes
a.elem_indices = a.indexes
local aA = function(f, ab, X, d, aB)
    while true do
        if d == nil or f(aB) then
            break
        end
        d, aB = ab(X, d)
    end
    return d, aB
end
local aC
local aD = function(f, ab, X, d)
    return aC(f, ab, X, ab(X, d))
end
aC = function(f, ab, X, d, ...)
    if d == nil then
        return nil
    end
    if f(...) then
        return d, ...
    end
    return aD(f, ab, X, d)
end
local aE = function(f, ab, X, d, ...)
    if select('#', ...) < 2 then
        return aA(f, ab, X, d, ...)
    else
        return aC(f, ab, X, d, ...)
    end
end
local aF = function(n, d)
    local f, ab, X = n[1], n[2], n[3]
    return aE(f, ab, X, ab(X, d))
end
local aG = function(f, q, n, o)
    return p(aF, { f, q, n }, o)
end
b.filter = I(aG)
a.filter = N(aG)
b.remove_if = b.filter
a.remove_if = a.filter
local aH = function(aI, q, n, o)
    local f = aI
    if type(aI) == 'string' then
        f = function(aw)
            return string.find(aw, aI) ~= nil
        end
    end
    return aG(f, q, n, o)
end
b.grep = I(aH)
a.grep = N(aH)
local aJ = function(f, q, n, o)
    local aK = function(...)
        return not f(...)
    end
    return aG(f, q, n, o), aG(aK, q, n, o)
end
b.partition = I(aJ)
a.partition = N(aJ)
local aL = function(f, V, o, ...)
    if o == nil then
        return nil, V
    end
    return o, f(V, ...)
end
local aM = function(f, V, ab, X, d)
    while true do
        d, V = aL(f, V, ab(X, d))
        if d == nil then
            break
        end
    end
    return V
end
b.foldl = K(aM)
a.foldl = O(aM)
b.reduce = b.foldl
a.reduce = a.foldl
local aN = function(q, n, o)
    if q == x or q == v then
        return #n
    end
    local aO = 0
    repeat
        o = q(n, o)
        aO = aO + 1
    until o == nil
    return aO - 1
end
b.length = H(aN)
a.length = M(aN)
local aP = function(q, n, o)
    return q(n, g(o)) == nil
end
b.is_null = H(aP)
a.is_null = M(aP)
local aQ = function(aR, aS)
    local ab, X, d = G(aR)
    local aT, aU, aV = G(aS)
    local aW, aX
    for ac = 1, 10, 1 do
        d, aW = ab(X, d)
        aV, aX = aT(aU, aV)
        if d == nil then
            return true
        end
        if aV == nil or aW ~= aX then
            return false
        end
    end
end
b.is_prefix_of = aQ
a.is_prefix_of = aQ
local aY = function(f, ab, X, d)
    local w
    repeat
        d, w = e(f, ab(X, d))
    until d == nil or not w
    return d == nil
end
b.all = I(aY)
a.all = N(aY)
b.every = b.all
a.every = a.all
local aZ = function(f, ab, X, d)
    local w
    repeat
        d, w = e(f, ab(X, d))
    until d == nil or w
    return not not w
end
b.any = I(aZ)
a.any = N(aZ)
b.some = b.any
a.some = a.any
local a_ = function(q, n, o)
    local b0 = 0
    local w = 0
    repeat
        b0 = b0 + w
        o, w = q(n, o)
    until o == nil
    return b0
end
b.sum = H(a_)
a.sum = M(a_)
local b1 = function(q, n, o)
    local b2 = 1
    local w = 1
    repeat
        b2 = b2 * w
        o, w = q(n, o)
    until o == nil
    return b2
end
b.product = H(b1)
a.product = M(b1)
local b3 = function(a9, a8)
    if a8 < a9 then
        return a8
    else
        return a9
    end
end
local b4 = function(a9, a8)
    if a8 > a9 then
        return a8
    else
        return a9
    end
end
local b5 = function(q, n, o)
    local o, a9 = q(n, o)
    if o == nil then
        error('min: iterator is empty')
    end
    local b6
    if type(a9) == 'number' then
        b6 = math.min
    else
        b6 = b3
    end
    for b7, w in q, n, o do
        a9 = b6(a9, w)
    end
    return a9
end
b.min = H(b5)
a.min = M(b5)
b.minimum = b.min
a.minimum = a.min
local b8 = function(b6, ab, X, d)
    local d, a9 = ab(X, d)
    if d == nil then
        error('min: iterator is empty')
    end
    for b7, w in ab, X, d do
        a9 = b6(a9, w)
    end
    return a9
end
b.min_by = I(b8)
a.min_by = N(b8)
b.minimum_by = b.min_by
a.minimum_by = a.min_by
local b9 = function(ab, X, d)
    local d, a9 = ab(X, d)
    if d == nil then
        error('max: iterator is empty')
    end
    local b6
    if type(a9) == 'number' then
        b6 = math.max
    else
        b6 = b4
    end
    for b7, w in ab, X, d do
        a9 = b6(a9, w)
    end
    return a9
end
b.max = H(b9)
a.max = M(b9)
b.maximum = b.max
a.maximum = a.max
local ba = function(b6, ab, X, d)
    local d, a9 = ab(X, d)
    if d == nil then
        error('max: iterator is empty')
    end
    for b7, w in ab, X, d do
        a9 = b6(a9, w)
    end
    return a9
end
b.max_by = I(ba)
a.max_by = N(ba)
b.maximum_by = b.max_by
a.maximum_by = a.max_by
local bb = function(ab, X, d)
    local A, B, bc = {}
    while true do
        d, bc = ab(X, d)
        if d == nil then
            break
        end
        table.insert(A, bc)
    end
    return A
end
b.totable = H(bb)
a.totable = M(bb)
local bd = function(ab, X, d)
    local A, B, bc = {}
    while true do
        d, B, bc = ab(X, d)
        if d == nil then
            break
        end
        A[B] = bc
    end
    return A
end
b.tomap = H(bd)
a.tomap = M(bd)
local z = function(n, o)
    local ab, X, f = n[1], n[2], n[3]
    return e(f, ab(X, o))
end
local be = function(f, q, n, o)
    return p(z, { q, n, f }, o)
end
b.map = I(be)
a.map = N(be)
local bf = function(o, ac, d, ...)
    if d == nil then
        return nil
    end
    return { ac + 1, d }, ac, ...
end
local bg = function(n, o)
    local ab, X = n[1], n[2]
    local ac, d = o[1], o[2]
    return bf(o, ac, ab(X, d))
end
local bh = function(q, n, o)
    return p(bg, { q, n }, { 1, o })
end
b.enumerate = H(bh)
a.enumerate = M(bh)
local bi = function(ac, d, ...)
    if d == nil then
        return nil
    end
    return { ac + 1, d }, ...
end
local bj = function(n, o)
    local aw, ab, X = n[1], n[2], n[3]
    local ac, d = o[1], o[2]
    if ac % 2 == 1 then
        return { ac + 1, d }, aw
    else
        return bi(ac, ab(X, d))
    end
end
local bk = function(aw, q, n, o)
    return p(bj, { aw, q, n }, { 0, o })
end
b.intersperse = I(bk)
a.intersperse = N(bk)
local function bl(n, o, bm, ...)
    if #bm == #n / 2 then
        return bm, ...
    end
    local ac = #bm + 1
    local ab, X = n[2 * ac - 1], n[2 * ac]
    local d, w = ab(X, o[ac])
    if d == nil then
        return nil
    end
    table.insert(bm, d)
    return bl(n, o, bm, w, ...)
end
local bn = function(n, o)
    return bl(n, o, {})
end
local bo = function(...)
    local a8 = select('#', ...)
    if a8 >= 3 then
        local bp = select(a8 - 2, ...)
        if
            type(bp) == 'table'
            and getmetatable(bp) == m
            and bp.param == select(a8 - 1, ...)
            and bp.state == select(a8, ...)
        then
            return a8 - 2
        end
    end
    return a8
end
local bq = function(...)
    local a8 = bo(...)
    if a8 == 0 then
        return p(s, nil, nil)
    end
    local n = { [2 * a8] = 0 }
    local o = { [a8] = 0 }
    local ac, ab, X, d
    for ac = 1, a8, 1 do
        local bp = select(a8 - ac + 1, ...)
        ab, X, d = D(bp)
        n[2 * ac - 1] = ab
        n[2 * ac] = X
        o[ac] = d
    end
    return p(bn, n, o)
end
b.zip = bq
a.zip = bq
local br = function(n, d, ...)
    if d == nil then
        local ab, X, bs = n[1], n[2], n[3]
        return ab(X, g(bs))
    end
    return d, ...
end
local bt = function(n, d)
    local ab, X, bs = n[1], n[2], n[3]
    return br(n, ab(X, d))
end
local bu = function(q, n, o)
    return p(bt, { q, n, o }, g(o))
end
b.cycle = H(bu)
a.cycle = M(bu)
local bv
local bw = function(n, o, d, ...)
    if d == nil then
        local ac = o[1]
        ac = ac + 1
        if n[3 * ac - 1] == nil then
            return nil
        end
        local d = n[3 * ac]
        return bv(n, { ac, d })
    end
    return { o[1], d }, ...
end
bv = function(n, o)
    local ac, d = o[1], o[2]
    local ab, X = n[3 * ac - 2], n[3 * ac - 1]
    return bw(n, o, ab(X, o[2]))
end
local bx = function(...)
    local a8 = bo(...)
    if a8 == 0 then
        return p(s, nil, nil)
    end
    local n = { [3 * a8] = 0 }
    local ac, ab, X, d
    for ac = 1, a8, 1 do
        local by = select(ac, ...)
        ab, X, d = G(by)
        n[3 * ac - 2] = ab
        n[3 * ac - 1] = X
        n[3 * ac] = d
    end
    return p(bv, n, { 1, n[3] })
end
b.chain = bx
a.chain = bx
local bz = {
    lt = function(aB, bA)
        return aB < bA
    end,
    le = function(aB, bA)
        return aB <= bA
    end,
    eq = function(aB, bA)
        return aB == bA
    end,
    ne = function(aB, bA)
        return aB ~= bA
    end,
    ge = function(aB, bA)
        return aB >= bA
    end,
    gt = function(aB, bA)
        return aB > bA
    end,
    add = function(aB, bA)
        return aB + bA
    end,
    div = function(aB, bA)
        return aB / bA
    end,
    floordiv = function(aB, bA)
        return math.floor(aB / bA)
    end,
    intdiv = function(aB, bA)
        local bB = aB / bA
        if aB >= 0 then
            return math.floor(bB)
        else
            return math.ceil(bB)
        end
    end,
    mod = function(aB, bA)
        return aB % bA
    end,
    mul = function(aB, bA)
        return aB * bA
    end,
    neq = function(aB)
        return -aB
    end,
    unm = function(aB)
        return -aB
    end,
    pow = function(aB, bA)
        return aB ^ bA
    end,
    sub = function(aB, bA)
        return aB - bA
    end,
    truediv = function(aB, bA)
        return aB / bA
    end,
    concat = function(aB, bA)
        return aB .. bA
    end,
    len = function(aB)
        return #aB
    end,
    length = function(aB)
        return #aB
    end,
    land = function(aB, bA)
        return aB and bA
    end,
    lor = function(aB, bA)
        return aB or bA
    end,
    lnot = function(aB)
        return not aB
    end,
    truth = function(aB)
        return not not aB
    end,
}
a.operator = bz
b.operator = bz
a.op = bz
b.op = bz
setmetatable(a, {
    __call = function(bC, bD)
        for bE, bF in pairs(bC) do
            if rawget(_G, bE) ~= nil then
                local bG = 'function ' .. bE .. ' already exists in global scope.'
                if bD then
                    rawset(_G, bE, bF)
                    print('WARNING: ' .. bG .. ' Overwritten.')
                else
                    print('NOTICE: ' .. bG .. ' Skipped.')
                end
            else
                rawset(_G, bE, bF)
            end
        end
    end,
})
for luafun_key, luafun_value in pairs(a) do
    _G[luafun_key] = luafun_value
end

local number = io.read('n')

print(table.concat(
    range(number, 1, -1)
        :map(function(index)
            return ('+'):rep(number - index) .. table.concat(range(index):totable(), '')
        end)
        :totable(),
    '\n'
))
