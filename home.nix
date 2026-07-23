{ pkgs, inputs, ... }:

{
  home.username = "anto";
  home.homeDirectory = "/home/anto";

  imports = [
    inputs.noctalia.homeModules.default
  ];

  # User-specific packages
  home.packages = with pkgs; [
    btop
  ];

  # Noctalia Shell configuration
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

  programs.home-manager.enable = true;
  home.stateVersion = "26.05";
}

