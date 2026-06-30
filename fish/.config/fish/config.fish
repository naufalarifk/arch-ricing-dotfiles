fish_add_path /home/naufal/Projects/flutter/bin


function ocivpn
    # Check if warp-cli status outputs "Connected"
    if warp-cli status | grep -iqw "connected"
        echo "Error: Cloudflare WARP is currently connected. Aborting OpenVPN." >&2
        return 1
    end

    # If WARP is not connected, run your specific OpenVPN config.
    # $argv passes any extra arguments to openvpn (like --daemon)
    sudo openvpn --config ~/Downloads/naufal.ovpn $argv
end


# Added by Antigravity CLI installer
set -gx PATH "/home/naufal/.local/bin" $PATH
