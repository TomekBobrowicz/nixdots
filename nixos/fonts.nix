{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      roboto
      work-sans
      comic-neue
      source-sans
      comfortaa
      inter
      lato
      lexend
      jost
      dejavu_fonts
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      nerd-fonts.fira-code
      nerd-fonts.meslo-lg
      openmoji-color
      twemoji-color-font
      fira-code
      fira-code-symbols
      font-awesome
      hackgen-nf-font
      ibm-plex
      jetbrains-mono
      material-icons
      nerd-fonts.im-writing
      nerd-fonts.blex-mono
      powerline-fonts
      symbola
      terminus_font
    ];

    enableDefaultPackages = false;
  };
}
