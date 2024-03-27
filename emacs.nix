{ config, pkgs, ... }:
let
  myEmacs = with pkgs; (emacsPackagesFor emacs29).emacsWithPackages (epkgs: with epkgs; [
    treesit-grammars.with-all-grammars
  ]);
in
{
  environment.systemPackages = (with pkgs; [
    myEmacs                             # overlayed emacs version 29
    epdfview                            # pdf-tools requirement
    ffmpegthumbnailer                   # dirvish requirement
    mediainfo                           # dirvish requirement
    mpg123                              # dirvish requirement
  ]);
  services.emacs = {
    enable = true;
    package = myEmacs;
    startWithGraphical = true;
  };
}
