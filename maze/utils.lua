function mod2(i, m)
    local n = i % m
    if n == 0 then
        n = m
    end
    return n
end

function dump(t, indent)
    local indent = indent or ""
    local o = ""
    for k, v in pairs(t) do
        o = o..indent.."["..tostring(k).."]"
        if type(v) == "table" then
            o = o..":\n"..dump(v, indent.."\t")
        else
            o = o.." - "..tostring(v).."\n"
        end
    end
    return o
end

function str2tbl(s)
    local t1 = {}
    local function lin(l) table.insert(t1, l); return "" end
    lin((s:gsub("(.-)\n", lin)))
    local m = {}
    for i=1, #t1 do
        if t1[i] then
            local r = t1[i]:gsub("\n+$", "")
            if string.len(r) > 0 then
                local t2 = {}
                r:gsub(".", function(c) table.insert(t2, c) end)
                m[i] = t2
            end
        end
    end
    return m
end

function rand(max)
    for i=1, 10 do
        math.random(max)
    end
    return math.random(max)
end

function start_point(maze_width, maze_height)
    local r = rand(4)
    local x = 1
    local y = 1
    if r == 1 then
        x = 1
        y = rand(maze_height)
    elseif r == 2 then
        x = maze_width
        y = rand(maze_height)
    elseif r == 3 then
        x = rand(maze_width)
        y = 1
    else -- r == 4
        x = rand(maze_width)
        y = maze_height
    end
    return x, y
end
