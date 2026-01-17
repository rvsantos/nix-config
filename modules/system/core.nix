{ config, pkgs, ... }:

{
  # 1. Configurações Globais do Nix
  nix = {
    settings = {
      # Ativa Flakes e os novos comandos (nix shell, nix run, etc)
      experimental-features = [ "nix-command" "flakes" ];
      
      # Otimiza o armazenamento criando hard links para arquivos idênticos
      auto-optimise-store = true;
    };

    # 2. Coleta de Lixo (Garbage Collector) - Mantendo 30 dias de histórico
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  # 3. Permite softwares não-livres (Unfree)
  nixpkgs.config.allowUnfree = true;

  # 4. Pacotes mínimos que você quer em QUALQUER lugar (mesmo na VM)
  environment.systemPackages = with pkgs; [
    git
    vim
    curl
    wget
    htop
  ];
}