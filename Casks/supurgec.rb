cask "supurgec" do
  version "0.4.0-alpha"
  sha256 "6f3681bed9bc9b0c54f264d5299f5e463eec5b8919efc6d6ad50b18f4b27d831"

  url "https://github.com/skyeso/supurgec-macos/releases/download/v#{version}/Supurgec-v0.4-alpha-macOS.dmg"
  name "Süpürgeç"
  desc "Yerel macOS temizlik, bakım, optimizasyon ve menü çubuğu sistem izleme uygulaması"
  homepage "https://github.com/skyeso/supurgec-macos"

  depends_on macos: :sonoma

  app "Süpürgeç.app"

  postflight_steps do
    run "/usr/bin/xattr", args: ["-cr", "{{appdir}}/Süpürgeç.app"]
  end

  uninstall quit: "com.eso.supurgec"

  zap trash: [
    "~/Library/Preferences/com.eso.supurgec.plist",
    "~/Library/Saved Application State/com.eso.supurgec.savedState",
  ]
end
