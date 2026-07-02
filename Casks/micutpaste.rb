cask "micutpaste" do
  version "1.0"
  sha256 "29ae39e4223bd0679346b576ec40549ecaf19c71239d586c264cf327015e2cca"

  url "https://github.com/metin-aksu/miCutPaste/releases/download/v#{version}/miCutPaste-#{version}.dmg"
  name "miCutPaste"
  desc "Adds Cut from Here and Paste Here to Finder's right-click menu"
  homepage "https://github.com/metin-aksu/miCutPaste"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "miCutPaste.app"

  uninstall quit: [
    "com.metinaksu.micutpaste",
    "com.metinaksu.micutpaste.FinderExtension",
  ]

  zap trash: [
    "~/Library/Containers/com.metinaksu.micutpaste.FinderExtension",
    "~/Library/Preferences/com.metinaksu.micutpaste.plist",
  ]

  caveats <<~EOS
    miCutPaste is signed with a Developer ID but is not notarized, so macOS
    quarantines it on install. If it refuses to open, clear the flag once:

      xattr -dr com.apple.quarantine "#{appdir}/miCutPaste.app"

    (Or right-click miCutPaste.app in Finder → Open → Open the first time.)

    After the first launch, enable the Finder extension:
      System Settings → General → Login Items & Extensions → Finder → miCutPaste

    Note: the menu items do not appear in Desktop/Documents while iCloud's
    "Desktop & Documents Folders" syncing is enabled (Apple platform limitation).
  EOS
end
