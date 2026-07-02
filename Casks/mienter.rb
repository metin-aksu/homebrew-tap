cask "mienter" do
  version "1.0"
  sha256 "345d5cd101bc678c5644fedf9d57b1d777d3ea3e857a78b3411c67594f89387a"

  url "https://github.com/metin-aksu/miEnter/releases/download/v#{version}/miEnter.dmg",
      verified: "github.com/metin-aksu/miEnter/"
  name "miEnter"
  desc "Makes Enter open the selected file in Finder instead of renaming it"
  homepage "https://github.com/metin-aksu/miEnter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "miEnter.app"

  caveats <<~EOS
    miEnter is signed with a Developer ID but is not notarized, so macOS
    quarantines it on install. If it refuses to open, reinstall with:

      brew install --cask --no-quarantine mienter

    or clear the flag manually:

      xattr -dr com.apple.quarantine "#{appdir}/miEnter.app"

    miEnter also needs Accessibility permission to intercept the Enter key:
      System Settings → Privacy & Security → Accessibility → enable miEnter
  EOS
end
