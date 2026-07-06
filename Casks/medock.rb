cask "medock" do
  version "1.0"
  sha256 "7034f44a9422f1bf534352d6b7d139a1ec1e6e6359ebb377b489bb5f3f731018"

  url "https://github.com/metin-aksu/meDock/releases/download/v#{version}/meDock-#{version}.dmg"
  name "meDock"
  desc "Windows-style taskbar: Start menu, pinned/running apps, system tray"
  homepage "https://github.com/metin-aksu/meDock"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "meDock.app"

  uninstall quit: "com.metinaksu.medock"

  zap trash: [
    "~/Library/Application Support/meDock",
    "~/Library/Preferences/com.metinaksu.medock.plist",
  ]

  caveats <<~EOS
    meDock is signed with a Developer ID but is not notarized, so macOS
    quarantines it on install. If it refuses to open, clear the flag once:

      xattr -dr com.apple.quarantine "#{appdir}/meDock.app"

    (Or right-click meDock.app in Finder → Open → Open the first time.)

    For window management (minimize, window lists) grant Accessibility:
      System Settings → Privacy & Security → Accessibility → meDock
    Live window previews additionally need Screen Recording permission.
  EOS
end
