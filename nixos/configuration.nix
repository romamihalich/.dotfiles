# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ru_RU.UTF-8";
    LC_IDENTIFICATION = "ru_RU.UTF-8";
    LC_MEASUREMENT = "ru_RU.UTF-8";
    LC_MONETARY = "ru_RU.UTF-8";
    LC_NAME = "ru_RU.UTF-8";
    LC_NUMERIC = "ru_RU.UTF-8";
    LC_PAPER = "ru_RU.UTF-8";
    LC_TELEPHONE = "ru_RU.UTF-8";
    LC_TIME = "ru_RU.UTF-8";
  };

  # Window manager
  services.xserver.enable = true;
  services.xserver.windowManager.awesome.enable = true;
  services.xserver.displayManager.lightdm.enable = true;

  services.udisks2.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "us,ru";
    xkbVariant = "";
    xkbOptions = "grp:alt_shift_toggle,caps:swapescape";
  };

  # Enable sound with pipewire
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.romamihalich = {
    isNormalUser = true;
    description = "romamihalich";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "romamihalich";
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "romamihalich";
  services.picom.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  environment.sessionVariables = rec {
    XDG_CACHE_HOME  = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME   = "$HOME/.local/share";
    XDG_STATE_HOME  = "$HOME/.local/state";

    # Not officially in the specification
    XDG_BIN_HOME    = "$HOME/.local/bin";
    PATH = [ 
      "${XDG_BIN_HOME}"
    ];

    BROWSER = "qutebrowser";
    TERMINAL = "alacritty";
  };

  environment.variables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
  };


  programs.zsh.syntaxHighlighting.enable = true;
  # environment.usr."share/zsh/plugins/zsh-history-substring-search".source = "${pkgs.zsh-history-substring-search}/share/zsh-history-substring-search/zsh-history-substring-search.zsh";
  # environment.usr."share/zsh/plugins/zsh-syntax-highlighting".source = "${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  gcc gnumake file
  neovim tmux
  man mlocate wget alacritty mpv qutebrowser vifm
  zsh zsh-syntax-highlighting zsh-completions zsh-history-substring-search
  go fzf nodejs
  ruby php ripgrep fd
  volumeicon pcmanfm gcolor2
  mypaint nitrogen qbittorrent xarchiver zathura
  bat yt-dlp sxiv udiskie stow dmenu neofetch xclip
  git rustup eza lazygit conky zip unzip
  ];

  # TODO: pip, java (zulu)
  # TODO: qutebrowser: pdfjs, python-adblock
  # TODO: neovim: package, node
  # TODO: keyboard indicator sbxkb 
  # TODO: figure out themes and icons, fonts

  programs.neovim.defaultEditor = true;

  programs.npm.enable = true;

  programs.nm-applet.enable = true;
  programs.zsh.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
