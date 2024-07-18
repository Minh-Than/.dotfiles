{pkgs, ...}:
{
    programs.bash.enable = true;

    programs.bash.bashrcExtra = "
        eval \"$(starship init bash)\"\n
        alias ksh=\"fastfetch\"\n
        alias rebuild=\"sudo nixos-rebuild switch --flake /home/impoor/.dotfiles#default\"
    ";
}
