#!/usr/bin/bash

required=(
  nvim
  xclip 
  rg
  fd
  fzf
)

declare -a not_installed=()

# Check system requirements
for c in ${required[@]}; do
  if ! command -v $c &> /dev/null; then
    not_installed+=($c)
  fi
done

# Check Nerd Font
FPATH="$HOME/.local/share/fonts"
if [[ -d "$FPATH" ]]; then
  if ! find "$FPATH" -name '*Nerd Font*' -printf 1 -quit | grep -q 1; then
    not_installed+=("Devicons")
  fi
else 
  not_installed+=("Devicons")
fi

if [ ${#not_installed[@]} -eq 0 ]; then
  echo "All dependencies are installed."
else 
  for nc in ${not_installed[@]}; do
    printf '[System] \e[1m%s\e[0m is required.\n' $nc
  done
fi

# Language servers
langs=(
  gopls
  vim-language-server
  typescript-language-server
  rust-analyzer
  pyright
  bash-language-server
)

for lsp in ${langs[@]}; do
  if ! command -v $lsp &> /dev/null; then
    printf '[LSP] \e[1m%s\e[0m is required.\n' $lsp
  fi
done

# Check NVIM Version
NVIMREQ="0.5"
NVIMVERSION="nvim --version | head -1 | sed -e 's|[^[^0-9]*||' -e 's| .*||'"
eval $NVIMVERSION | grep -q $NVIMREQ
if [[ $? -eq 0 ]]; then
  echo "NVIM version is correct."
else 
  echo "[Version] The required NVIM version is $NVIMREQ"
fi
