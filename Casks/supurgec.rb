cask "supurgec" do
  version "0.1.0-alpha"
  sha256 "e75ea2997ef9ddd1919e3c8650fdc03d0ea85b728a194a26ef1b95fbe387399b"

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
