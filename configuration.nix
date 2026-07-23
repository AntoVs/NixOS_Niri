{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # --- Bootloader & AMD Tuning ---
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];

  # --- Networking & System Base ---
  networking.hostName = "anto";
  networking.networkmanager.enable = true;
  time.timeZone = "Asia/Kolkata";
  i18n.defaultLocale = "en_US.UTF-8";

  # --- User Profile Setup ---
  users.users.anto = {
    isNormalUser = true;
    description = "anto";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" ];
  };

  # --- System Services ---
  services = {
    displayManager.ly.enable = true;
    flatpak.enable = true;
    upower.enable = true;
    power-profiles-daemon.enable = true;
    gvfs.enable = true;
    dbus.enable = true;
    xserver.videoDrivers = [ "amdgpu" ];
    
    # AMD GPU Controller daemon
    lact.enable = true; 

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };

  # --- Hardware & Drivers ---
  hardware = {
    bluetooth.enable = true;
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu.overdrive.enable = true; 
  };

  security.polkit.enable = true;
  security.rtkit.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  # --- Environment Variables ---
  environment.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "26.05";
}

