cask "common-bar" do
  version "0.3.0"
  sha256 "a4d6edeaab0ef85e3b912d5cb3b881e1fb248c869eaf67eb3567a25795118357"

  url "https://github.com/oddurs/common-bar/releases/download/v#{version}/CommonBar.zip",
      verified: "github.com/oddurs/"
  name "Common Bar"
  desc "Hides the menu bar icons you rarely use behind a chevron"
  homepage "https://oddurs.github.io/common-tools/bar/"

  livecheck do
    skip "Written by the Release workflow of oddurs/common-tools"
  end

  depends_on macos: ">= :sonoma"

  app "Common Bar.app"

  postflight do
    # The build is signed but not notarized; without this macOS would ask you to allow it in
    # Privacy & Security before the first open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Common Bar.app"]
  end

  uninstall quit: "com.oddurs.reasonal"

  zap trash: "~/Library/Preferences/com.oddurs.reasonal.plist"
end
