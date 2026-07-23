{ pkgs, inputs, ... }:

{
  networking.networkmanager.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Installs the desktop shell binary globally
  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}

