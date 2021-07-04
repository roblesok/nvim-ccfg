# NVIM Custom Configuration

Requires nvim `v-0.5`.

## Usage

```
--- Clone repository

$ git clone https://github.com/roblesok/nvim-ccfg ~/.config/nvim

--- If packer is required press(y) to install when open nvim

--- Install plugins and compile 

:PackerInstall
:PackerCompile
```

## Requirements

```
--- NOTE: this is not ready yet
$ bash check.sh
```

## Language Servers

- `gopls`
- `tsserver`
- `rust_analyzer`
- `pyright`
- `vimls`
- `flutter` 

## Key Mappings

The leader is `,`.

Fast saving: 

```
nmap <leader>w  ---> Save Current Buffer
```

Windows:

```
nmap <leader>vs  ---> Versical Split
nmap <leader>hs  ---> Horizontal Split
nmap <C-h>       ---> Right
nmap <C-j>       ---> Bottom
nmap <C-k>       ---> Top
napm <C-l>       ---> Left
napm <C-o>       ---> Close all except current
```

Close buffers:

```
nmap bd  ---> Delete current buffer
nmap bn  ---> Next Buffer
```

Yank/Paste:

```
vmap <C-y>  ---> Yank block
nmap <C-y>  ---> Yank one line
nmap <C-p>  ---> Paste
```

NvimTree:

```
nmap <M-1>  ---> Tree Toggle
```

NvimComment:

```
nmap gcc   ---> comment current line
vmap gc    ---> comment block
```

Telescope:

```
-- FILES
<space>ft   ---> Git Files
<space>fg   ---> Live Grep
<space>gw   ---> Grep String
<space>pp   ---> Project Search
<space>fe   ---> File Browser
<space>fd   ---> Find Files

-- GIT
<space>gs   ---> Git Status
<space>gc   ---> Git Commits

-- NVIM
<space>fb   ---> All buffers
<space>ff   ---> Current Buffer Fuzzy
<space>fh   ---> Help Tags
```

Language Server Protocol:

```
-- Diagnostics
dn          ---> Next Diagnostic
dp          ---> Previous Diagnostic
dl          ---> Show line diagnostic

-- Code/Documentation
gD          ---> Go to Declaration
gd          ---> Go to Definition
K           ---> Hover Doc
gi          ---> Go to Implementation

--  Actions
<space>ca   ---> Code Actions
<space>rn   ---> Rename
   
-- Formatting
<leader>ff  ---> Document Format
```

Snippets:

```
<C-l>  ---> expand or jump 
```

Flutter tools:

```
<space>fc ---> Flutter commands
```
