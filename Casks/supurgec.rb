cask "supurgec" do
  version "0.3.0-alpha"
  sha256 "f7be1cb78229a0a17583452bae946ec029b6258040a5deea63215a160f1c398f"

  url "https://github.com/skyeso/supurgec-macos/releases/download/v#{version}/Supurgec-v0.3-alpha-macOS.dmg"
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
