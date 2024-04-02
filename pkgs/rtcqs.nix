{pkgs, fetchPypi, ... }:

pkgs.python3.pkgs.buildPythonApplication rec {
    pname = "rtcqs";
    version = "0.6.2";
    format = "pyproject";
    # Dont check that the gui portion of the rtcqs package can be run; it uses
    # PySimpleGUI, which, though it is available in nixpkgs, doesn't work
    # properly; it is also a deliberately obfuscated commercial library, and
    # thus not worth fixing.  For our purposes, we just want to be able to run
    # the command-line tool.
    pythonRuntimeDepsCheckHook = "true";
    buildInputs = [
      pkgs.python3.pkgs.setuptools
    ];
    src = fetchPypi {
      inherit pname version;
      hash = "sha256-DfeV9kGhdMf6hZ1iNJ0L3HUn7m8c1gRK5cjtJNUAvJI=";
    };
}
