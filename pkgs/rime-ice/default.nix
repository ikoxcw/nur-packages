{ stdenv
, lib
, fetchurl
}:

stdenv.mkDerivation {
  pname = "rime-ice";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/iDvel/rime-ice/archive/d5c52a962653fc7233ba5c48641c390c9390618e.tar.gz";
    sha256 = "sha256-+x16pbwlmqh67B6xPAzSHQYh/xnBLOXeuyZ9bQcpd74=";
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
