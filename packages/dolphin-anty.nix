{
  lib,
  appimageTools,
  fetchurl,
}:

let
  pname = "dolphin-anty"; # Executable name
  version = "latest";
  sourceName = "dolphin_anty"; # This name is used in the source code
  desktopFile = "${sourceName}.desktop";

  src = fetchurl {
    url = "https://dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-x86_64-${version}.AppImage";
    hash = "sha256-oIURWELCp0bgoFwP7dht+i0noBFWNFCTjBL35QT3Fh0=";
  };

  appimageContents = appimageTools.extractType1 { inherit pname version src; };
in
appimageTools.wrapType2 {
  inherit pname version src;

  extraInstallCommands = ''
    # Install desktop file for application menu integration
    install -m 444 -D ${appimageContents}/${desktopFile} $out/share/applications/${desktopFile}

    # Install application icon
    install -m 444 -D ${appimageContents}/usr/share/icons/hicolor/256x256/apps/${sourceName}.png \
      $out/share/icons/hicolor/256x256/apps/${sourceName}.png

    # Fix desktop file to use wrapper executable
    substituteInPlace $out/share/applications/${desktopFile} \
      --replace-fail 'Exec=AppRun' 'Exec=${pname}'
  '';

  meta = {
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    mainProgram = pname;
  };
}
