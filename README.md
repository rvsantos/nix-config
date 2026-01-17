# ❄️ nix-config (Modular Snowflake)

Este repositório contém minha configuração modular do **NixOS**, estruturada com **Flakes** e **Home-Manager**. O objetivo é ter um sistema reprodutível, organizado e fácil de transportar entre diferentes máquinas (Desktop/Laptop).

## 🚀 Destaques do Setup
- **Interface:** Niri (Scrollable Window Manager) + DankMaterialShell (DMS).
- **Shell:** Fish com integração nativa.
- **Editor:** Emacs (otimizado para Wayland/PGTK).
- **Hardware:** Otimizado para GPUs AMD.
- **Workflow:** Terminal moderno com Superfile e Foot.

## 🛠️ Estrutura de Pastas
```text
.
├── flake.nix             # Ponto de entrada do sistema
├── hosts/                # Configurações específicas por máquina
│   └── desktop/          # Configurações do meu computador principal
│       ├── settings.nix  # <-- ONDE AS ESCOLHAS TRUE/FALSE SÃO FEITAS
│       └── ...
├── modules/              # Lógica modular (reutilizável)
│   ├── options.nix       # Definição das chaves customizadas
│   └── ...
└── users/                # Configurações de usuário (Home-Manager)