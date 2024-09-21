{ stdenv
, lib
, fetchurl
}:

stdenv.mkDerivation {
  pname = "rime-icea";
  version = "0.1";

  src = fetchurl {
    url = "https://github.com/ikoxcw/rime-icea/archive/f1b4f412043df7c5c494528163c79559734c553e.tar.gz";
    sha256 = "sha256-tkuQCFTGWQg8P7jxgGJSGm1hLH99LIH+7pyxxOmj63Y=";
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
