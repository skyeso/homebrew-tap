cask "supurgec" do
  version "0.1.0-alpha"
  sha256 "4feaab98e1faf5542e8fd4bd9dfaf7c25d238f7ce850dbb1f5e8257cb69ac8ef"

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
