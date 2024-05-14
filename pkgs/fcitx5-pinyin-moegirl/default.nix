{ stdenv
, lib
, fetchurl
}:
stdenv.mkDerivation rec {
  pname = "fcitx5-pinyin-moegirl";
  version = "20240509";

  src = fetchurl {
    url = "https://github.com/outloudvi/mw2fcitx/releases/download/20240509/moegirl.dict";
    sha256 = "sha256-JIhIfH7QzF2v99aqW17wc/K+AcmujUejud8r694wNjc=";
  };

  dontUnpack = true;

  installPhase = ''
    install -Dm 644 $src $out/share/fcitx5/pinyin/dictionaries/fcitx5-pinyin-moegirl.dict
  '';

  meta = with lib;{
    description = "Fcitx 5 pinyin dictionary generator for MediaWiki instances";
    homepage = "https://github.com/outloudvi/mw2fcitx";
    license = licenses.unlicense;
  };
}
