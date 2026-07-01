cask "miviewer" do
  version "1.0"
  sha256 "b893f22439b5e02aded36c23b532c3c8d7a85683a6dd75df9110e0541f7080c0"

  url "https://github.com/metin-aksu/miViewer/releases/download/v#{version}/miViewer-#{version}.dmg"
  name "miViewer"
  desc "Folder-aware macOS image viewer with keyboard navigation and zoom"
  homepage "https://github.com/metin-aksu/miViewer"

  depends_on macos: ">= :sonoma"

  app "miViewer.app"

  zap trash: [
    "~/Library/Preferences/com.metinaksu.miViewer.plist",
    "~/Library/Saved Application State/com.metinaksu.miViewer.savedState",
  ]
end