cask "common-keys" do
  version "0.2.0"
  sha256 "3dd1af5e5630b11973fb7d1d59dc29cd37add4c3566e49a7444eac349778c185"

  url "https://github.com/oddurs/common-keys/releases/download/v#{version}/CommonKeys.zip",
      verified: "github.com/oddurs/"
  name "Common Keys"
  desc "Fixes words typed on the wrong keyboard"
  homepage "https://oddurs.github.io/common-tools/keys/"

  livecheck do
    skip "Written by the Release workflow of oddurs/common-tools"
  end

  depends_on macos: :sonoma

  app "Common Keys.app"

  # The build is signed but not notarized; without this macOS would ask you to allow it in
  # Privacy & Security before the first open.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Common Keys.app"]
  end

  uninstall quit: "com.oddurs.langsmart"

  zap trash: "~/Library/Preferences/com.oddurs.langsmart.plist"
end
