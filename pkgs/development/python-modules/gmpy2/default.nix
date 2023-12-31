{ lib
, buildPythonPackage
, fetchFromGitHub
, isPyPy
, gmp
, mpfr
, libmpc
}:

let
  pname = "gmpy2";
  version = "2.1.5";
  format = "setuptools";
in

buildPythonPackage {
  inherit pname version;

  disabled = isPyPy;

  src = fetchFromGitHub {
    owner = "aleaxit";
    repo = "gmpy";
    rev = "gmpy2-${version}";
    hash = "sha256-yzan3Hu8+ncM8tMAz594GwHXFWJJOJVJGlLHi7bfQDU=";
  };

  buildInputs = [ gmp mpfr libmpc ];

  pythonImportsCheck = [ "gmpy2" ];

  meta = with lib; {
    description = "GMP/MPIR, MPFR, and MPC interface to Python 2.6+ and 3.x";
    homepage = "https://github.com/aleaxit/gmpy/";
    license = licenses.gpl3Plus;
  };
}
