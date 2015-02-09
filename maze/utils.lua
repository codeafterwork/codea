function mod2(i, m)
    local n = i % m
    if n == 0 then
        n = m
    end
    return n
end
