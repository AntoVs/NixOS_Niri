{ pkgs, ... }:

{
  programs = {
    fish.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vim wget git btop fastfetch kitty firefox pkgs.vlc
    kdePackages.polkit-kde-agent-1
    pkgs.heroic
    pkgs.android-tools
    pkgs.discord pkgs.telegram-desktop protonup-qt
    pkgs.nautilus
    gcc
    nixpkgs-fmt
    lact
    xwayland
    xwayland-satellite
    vulkan-tools
    polkit_gnome
    qt6Packages.qtwayland
    qt5.qtwayland
    qt6Packages.qt6ct
    libsForQt5.qtstyleplugin-kvantum
    adwaita-icon-theme
    papirus-icon-theme
    bibata-cursors
  ];
}
