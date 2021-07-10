function conky_F2C(f)
    local c = (5.0/9.0)*(f-32.0)
    return c
end

function conky_C2F(c)
    local f = c*(9.0/5.0)+32.0
    return f
end

function conky_vcgencmd_measure_temp_degC()
    local fstr = conky_parse("${exec vcgencmd measure_temp}")
    local fsub = fstr:gsub("temp=", "")
    fsub = fsub:gsub("'C","")
    return fsub
end

function conky_vcgencmd_measure_temp_degF()
    local fstr = conky_parse("${exec vcgencmd measure_temp}")
    -- print(fstr)
    local fsub = fstr:gsub("temp=", "")
    fsub = fsub:gsub("'C","")
    -- print(fsub)
    local fint = tonumber(fsub)
    -- print(fint)
    return fint*(9.0/5.0)+32.0
end

function conky_vcgencmd_gpu_freq_mhz()
    local fstr = conky_parse("${exec vcgencmd measure_clock core}")
    -- print(fstr)
    local fsub = fstr:gsub("frequency%(1%)=", "")
    -- print(fsub)
    local fint = tonumber(fsub)
    -- print(fint)
    return fint / 1000000
end

function conky_vcgencmd_gpu_mem_mb()
    local fstr = conky_parse("${exec vcgencmd get_mem gpu}")
    local fsub, numrep = fstr:gsub("gpu=", "")
    return fsub
end

function conky_get_boot_block_device_name()
    local blk = conky_parse("${exec readlink -f /dev/block/$(mountpoint -d /boot/firmware)}")
    return blk
end

function conky_get_root_block_device_name()
    local blk = conky_parse("${exec readlink -f /dev/block/$(mountpoint -d /)}")
    return blk
end

function conky_get_public_ipv4_addr()
    local addr = conky_parse("${exec dig +short myip.opendns.com @resolver1.opendns.com}")
    return addr
end
