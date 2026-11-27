cask "supurgec" do
  version "0.2.0-alpha"
  sha256 "2acbdc879f7487e08d6e268b51ab479c7130bb5b8a939965b5772276cf060431"

  url "https://github.com/skyeso/supurgec-macos/releases/download/v#{version}/Supurgec-v0.2-alpha-macOS.dmg"
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
