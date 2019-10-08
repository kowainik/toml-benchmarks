{ mkDerivation, base, gauge, stdenv }:
mkDerivation {
  pname = "toml-benchmarks";
  version = "0.0.0.0";
  src = ./.;
  libraryHaskellDepends = [ base ];
  benchmarkHaskellDepends = [ base gauge ];
  homepage = "https://github.com/kowainik/toml-benchmarks";
  description = "Benchmarks for Haskell TOML decoding and encoding libraries";
  license = stdenv.lib.licenses.mpl20;
}
