{
  lib,
  appimageTools,
  fetchurl,
}:

let
  version = "latest";
  pname = "dolphin-anty";

  src = fetchurl {
    url = "https://dolphin-anty-cdn.com/anty-app/dolphin-anty-linux-x86_64-${version}.AppImage";
    hash = "sha256-oIURWELCp0bgoFwP7dht+i0noBFWNFCTjBL35QT3Fh0=";
  };

in
appimageTools.wrapType2 {
  inherit pname version src;

  meta = {
    description = "Dolphin Anty - anti-detect browser for multi-accounting";
    homepage = "https://dolphin-anty.com/";
    license = lib.licenses.unfree;
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    platforms = [ "x86_64-linux" ];
    mainProgram = "dolphin-anty";
  };
}
