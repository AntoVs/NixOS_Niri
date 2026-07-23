{ pkgs, inputs, ... }:

{
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  environment.systemPackages = [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  home-manager.users.anto = {
    imports = [ inputs.noctalia.homeModules.default ];
    programs.noctalia-shell = {
      enable = true;
      settings = {
        bar = {
          position = "top";
          widgets = {
            left = [ { id = "ControlCenter"; useDistroLogo = true; } ];
            center = [ { id = "Workspace"; } ];
            right = [ { id = "Clock"; } ];
          };
        };
      };
    };
  };
}

