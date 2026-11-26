cask "supurgec" do
  version "0.1.0-alpha"
  sha256 "7f18c08ed492d447cc05c9b69c477788365a8175137760a2cf72d63434a06edf"

  url "https://github.com/skyeso/supurgec-macos/releases/download/v#{version}/Supurgec-v0.1-alpha-macOS.dmg"
  name "Süpürgeç"
  desc "Yerel macOS temizlik, bakım, optimizasyon ve menü çubuğu sistem izleme uygulaması"
  homepage "https://github.com/skyeso/supurgec-macos"

  depends_on macos: :sonoma

  app "Süpürgeç.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Süpürgeç.app"],
                   sudo: false
  end

  uninstall launchctl: "com.eso.supurgec.menubar",
            quit:      "com.eso.supurgec"

  zap trash: [
    "~/Library/LaunchAgents/com.eso.supurgec.menubar.plist",
    "~/Library/Preferences/com.eso.supurgec.plist",
    "~/Library/Saved Application State/com.eso.supurgec.savedState",
  ]
end
