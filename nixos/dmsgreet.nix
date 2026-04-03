# DMS greeter is a display manager from Dank Material dank-material-shell.
{inputs, ...}: {
  imports = [
    #inputs.dankMaterialShell.nixosModules.dankMaterialShell.default
    inputs.dms.nixosModules.greeter
  ];

 programs.dank-material-shell.greeter = {
    enable = true;
    compositor.name = "niri";
    configHome = "/home/buber/";
  };
}
