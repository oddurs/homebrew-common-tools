cask "common-stats" do
  version "0.3.0"
  sha256 "fb23fb45785a4cf390e9fc34906485a5e7593b03436f20b9a2e62d2dd6f41924"

  url "https://github.com/oddurs/common-stats/releases/download/v#{version}/CommonStats.zip",
      verified: "github.com/oddurs/"
  name "Common Stats"
  desc "System stats in the macOS menu bar: CPU, GPU, memory, network, disk, storage, and battery"
  homepage "https://oddurs.github.io/common-tools/stats/"

  livecheck do
    skip "Written by the Release workflow of oddurs/common-tools"
  end

  depends_on macos: ">= :sonoma"

  app "Common Stats.app"

  postflight do
    # The build is signed but not notarized; without this macOS would ask you to allow it in
    # Privacy & Security before the first open.
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Common Stats.app"]
  end

  uninstall quit: "io.github.oddurs.StatBar"

  zap trash: "~/Library/Preferences/io.github.oddurs.StatBar.plist"
end
