{ stdenv
, lib
, fetchurl
}:

stdenv.mkDerivation {
  pname = "rime-icea";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/aysixi/rime-icea/archive/5e9c0994b9b8e2ffe69b355302dd9b9587dc0702.tar.gz";
    sha256 = "sha256-c4TOjRiWspP0K+6D4sO4IAIN4SHBQXAUO1irSA3i9Dc=";
  };

  # buildPhase = ''
  #   mv default.yaml rime_ice_suggestion.yaml
  # '';

  installPhase = ''
    mkdir -p $out/share/rime-data
    cp -r * $out/share/rime-data/
  '';

  meta = with lib; {
    maintainers = with lib.maintainers; [ xddxdd ];
    description = "Rime 配置：雾凇拼音 | 长期维护的简体词库";
    homepage = "https://github.com/iDvel/rime-ice";
    license = licenses.gpl3;
  };
}
