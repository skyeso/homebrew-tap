cask "atac" do
  version "0.1.0-alpha"
  sha256 "bef9cc737aa4f5e1628e6b570bd5409287b70e7fc3f88a1ad3181f849460be85"

  url "https://github.com/skyeso/atac-macos/releases/download/v#{version}/Atac-v0.1-alpha-macOS.dmg"
  name "Ataç"
  desc "Saf AppKit tabanlı, ultra düşük kaynak tüketimli macOS menü çubuğu pano yöneticisi"
  homepage "https://github.com/skyeso/atac-macos"

  depends_on macos: ">= :ventura"

  app "Ataç.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Ataç.app"],
                   sudo: false
  end

  uninstall quit: "com.eso.atac"

  zap trash: [
    "~/Library/Application Support/Atac",
    "~/Library/Preferences/com.eso.atac.plist",
    "~/Library/Saved Application State/com.eso.atac.savedState",
  ]
end
