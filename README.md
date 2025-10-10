# learning-haskell


## haskell setup using nix
```shell
nix-shell -p "haskellPackages.ghcWithPackages (pkgs: with pkgs; [ stack ])
```
