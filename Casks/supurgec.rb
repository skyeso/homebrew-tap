cask "supurgec" do
  version "0.1.0-alpha"
  sha256 "64a6a5fb28b2ed36427287f365101de255d41a17a21b5fd3b4a68f78d1947653"

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

  uninstall quit: "com.eso.supurgec"

  zap trash: [
    "~/Library/Preferences/com.eso.supurgec.plist",
    "~/Library/Saved Application State/com.eso.supurgec.savedState",
  ]
end
