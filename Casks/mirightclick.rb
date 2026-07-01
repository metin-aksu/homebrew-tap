cask "mirightclick" do
  version "1.0"
  sha256 "a0860ef28bdb41c271df311d8c95ec8cd27841a8b59e7e82e5706346f435e223"

  url "https://github.com/metin-aksu/miRightClick/releases/download/v#{version}/miRightClick.dmg"
  name "miRightClick"
  desc "Adds a New Text File item to Finder's right-click menu"
  homepage "https://github.com/metin-aksu/miRightClick"

  depends_on macos: :sonoma

  app "miRightClick.app"

  caveats <<~EOS
    miRightClick is not notarized. On first launch, allow it via
    System Settings → Privacy & Security → "Open Anyway".

    Then enable the Finder extension in System Settings → General →
    Login Items & Extensions, and restart Finder:
      killall Finder
  EOS

  zap trash: [
    "~/Library/Containers/com.metinaksu.miRightClick.FinderExtension",
  ]
end
