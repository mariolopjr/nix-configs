{ inputs, ... }:
let
  # adds custom packages
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # modifies existing packages
  modifications = final: prev: { };
in
inputs.nixpkgs.lib.composeManyExtensions [ additions modifications ]
