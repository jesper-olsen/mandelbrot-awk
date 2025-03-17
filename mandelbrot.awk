#!/usr/bin/awk -f

# Define width and height of the output
BEGIN {
    ll_x = -1.2
    ll_y =  0.20
    ur_x = -1.0
    ur_y =  0.35
    max_iter = 255
    if (width == 0) width = 100  # Default width
    if (height == 0) height = 75  # Default height
    if (png == 0)
        ascii_output(ll_x, ll_y, ur_x, ur_y, max_iter, width, height)
    else
        gptext_output(ll_x, ll_y, ur_x, ur_y, max_iter, width, height)
}

function ascii_output( ll_x, ll_y, ur_x, ur_y, max_iter, width, height) {
    fwidth = ur_x - ll_x
    fheight = ur_y - ll_y
    
    for (y = 0; y < height; y++) {
        for (x = 0; x < width; x++) {
            real = ll_x + x * fwidth / width
            imag = ur_y - y * fheight / height
            iter = escape_time(real, imag, max_iter)
            printf("%s", cnt2char(iter))
        }
        print ""  # New line for next row
    }
}

function gptext_output(ll_x, ll_y, ur_x, ur_y, max_iter, width, height) {
    fwidth = ur_x - ll_x
    fheight = ur_y - ll_y

    for (y = height; y > 0; y--) {
        row = ""  # Initialize empty row string
        for (x = 0; x < width; x++) {
            real = ll_x + x * fwidth / width
            imag = ur_y - y * fheight / height
            iter = escape_time(real, imag, max_iter)

            if (x > 0) row = row ", "  # Add comma if not first element
            row = row iter
        }
        print row  # Print full row
    }
}


# Computes escape time for a point (x, y)
function escape_time(x, y, max_iter, zr, zi, cr, ci, iter, tmp) {
    zr = 0
    zi = 0
    cr = x
    ci = y
    iter = 0

    while (iter < max_iter) {
        if ((zr * zr + zi * zi) > 4) {
            break
        }
        # Complex multiplication: (zr + zi*i)^2 = zr^2 - zi^2 + 2*zr*zi*i
        tmp = zr * zr - zi * zi + cr
        zi = 2 * zr * zi + ci
        zr = tmp
        iter++
    }
    return max_iter - iter
}

# Map escape time to ASCII characters
function cnt2char(value, symbols, ns, idx) {
    symbols = "MW2a_. "
    ns = length(symbols)
    idx = int(value / 255.0 * ns)
    return substr(symbols, idx+1, 1)  # AWK is 1-based index
}

