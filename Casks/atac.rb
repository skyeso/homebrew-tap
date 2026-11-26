cask "atac" do
  version "0.1.0-alpha"
  sha256 "10677c38d99f9fb56f097f2bc0d76377d878d9e89b150328ccec6b3dc05a8d0d"

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
