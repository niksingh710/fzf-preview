{ pkgs ? import <nixpkgs>, lib ? import <nixpkgs/lib> }:

pkgs.writeShellApplication {
  name = "fzf-preview";
  runtimeInputs = with pkgs;[ file jq bat glow w3m eza openssl atool p7zip libcdio odt2txt catdoc gnumeric exiftool chafa mediainfo ffmpegthumbnailer poppler_utils ];
  text = lib.readFile ./fzf-preview;

  meta = with lib; {
    description = "This is a fzf preview script to preview files in fzf";
    license = licenses.gpl3;
    platforms = platforms.linux ++ platforms.darwin;
    maintainers = with maintainers; [ niksingh710 ];
    mainProgram = "fzf-preview";
  };
}
