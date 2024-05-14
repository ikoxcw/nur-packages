{ stdenv
, lib
, fetchurl
}:

stdenv.mkDerivation {
  pname = "rime-ice";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/ikoxcw/rime-icea/archive/59e37e99ebabb58339af85727f72d4b192c3cfd7.tar.gz";
    sha256 = "sha256-j3m9CD/s7G07Kl7zpE82AS6siDNJW/rrKko4y3b/g5Q=";
  };

  buildPhase = ''
    mv default.yaml rime_ice_suggestion.yaml
  '';

  installPhase = ''
    mkdir -p $out/share/fcitx5/rime
    cp -r * $out/share/fcitx5/rime
  '';

  meta = with lib; {
    description = "Rime 配置：雾凇拼音 | 长期维护的简体词库";
    homepage = "https://github.com/iDvel/rime-ice";
    license = licenses.gpl3;
  };
}
