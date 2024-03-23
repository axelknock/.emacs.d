{ config, pkgs, ... }:

{
  environment.systemPackages = (with pkgs; [
    ((emacsPackagesFor emacs29).emacsWithPackages (epkgs: [
      epkgs.vterm
      epkgs.treesit-grammars.with-all-grammars
    ]))
    epdfview                            # emacs pdf-tools requirement
    ffmpegthumbnailer                   # emacs dirvish requirement
    mediainfo                           # emacs dirvish requirement
    mpg123                              # emacs dirvish requirement
  ]);
  services.emacs = {
    enable = true;
    package = (with pkgs; ((emacsPackagesFor emacs29).emacsWithPackages (epkgs: [
        epkgs.vterm
        epkgs.treesit-grammars.with-all-grammars
    ])));
    startWithGraphical = true;
  };
}
