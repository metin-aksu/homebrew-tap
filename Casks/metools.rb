cask "metools" do
  version "1.0"
  sha256 "33e1770ff2a6ef496e38902f5fb20a297b709b727ff8f84c41f0ee7f4762edd3"

  url "https://github.com/metin-aksu/meTools/releases/download/v#{version}/meTools-#{version}.dmg"
  name "meTools"
  desc "Finder power-ups: cut/paste and new-text-file context menus, plus keyboard shortcuts"
  homepage "https://github.com/metin-aksu/meTools"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "meTools.app"

  uninstall quit: [
    "com.metinaksu.metools",
    "com.metinaksu.metools.FinderExtension",
  ]

  zap trash: [
    "~/Library/Containers/com.metinaksu.metools.FinderExtension",
    "~/Library/Group Containers/Y5K2497B6G.com.metinaksu.metools",
    "~/Library/Preferences/com.metinaksu.metools.plist",
  ]

  caveats <<~EOS
    meTools is signed with a Developer ID but is not notarized, so macOS
    quarantines it on install. If it refuses to open, clear the flag once:

      xattr -dr com.apple.quarantine "#{appdir}/meTools.app"

    (Or right-click meTools.app in Finder → Open → Open the first time.)

    After the first launch:
      - Right-click menu: System Settings → General → Login Items & Extensions
        → Finder → meTools
      - Keyboard shortcuts: System Settings → Privacy & Security → Accessibility
        → meTools, and enable "Launch at Login" from the menu-bar icon

    Note: the context-menu items do not appear in Desktop/Documents while
    iCloud's "Desktop & Documents Folders" syncing is enabled (Apple platform
    limitation). Keyboard features are unaffected.
  EOS
end
