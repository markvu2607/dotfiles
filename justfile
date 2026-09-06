default:
    @just --list

apply-keyd:
    sudo mkdir -p /etc/keyd
    sudo stow -d system -t /etc/keyd keyd
    sudo keyd reload
    @systemctl is-active keyd