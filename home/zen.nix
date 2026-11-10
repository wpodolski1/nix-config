{ inputs, ... }:

let
  # Update this if the Zen profile is recreated or renamed.
  profile = "iyv8nqu3.Default Profile";
  chrome = "zen/${profile}/chrome";
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
  };

  # Catppuccin Mocha Sky browser chrome.
  xdg.configFile = {
    "${chrome}/userChrome.css".source = ./zen/userChrome.css;
    "${chrome}/userContent.css".source = ./zen/userContent.css;
  };
}
