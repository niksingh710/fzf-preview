{ pkgs ? import <nixpkgs>, lib ? import <nixpkgs/lib> }:

pkgs.writeShellApplication {
  name = "fzf-preview";
  runtimeInputs = with pkgs;[
    # Core utilities
    bat
    eza
    file
    jq

    # Compression and archiving
    atool
    p7zip

    # Document conversion and handling
    catdoc
    gnumeric
    odt2txt
    poppler-utils

    # Media tools
    chafa
    exiftool
    ffmpegthumbnailer
    libcdio
    mediainfo

    # Presentation and viewers
    glow
    w3m

    # Security
    openssl
  ];
  text = lib.readFile ./fzf-preview;

  meta = with lib; {
    description = "This is a fzf preview script to preview files in fzf";
    license = licenses.gpl3Only;
    platforms = platforms.unix;
    maintainers = with maintainers; [ niksingh710 ];
    mainProgram = "fzf-preview";
  };
}
