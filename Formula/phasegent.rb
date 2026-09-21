class Phasegent < Formula
  desc "Role-aware CLI for phase-oriented provider-backed workflows"
  homepage "https://github.com/cloudiful/phasegent"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.17.0/phasegent-v2.17.0-aarch64-apple-darwin"
      sha256 "cd04be315a5f40288fb8ca6fc231c2e02cf6e9934f20a40ed61924b19242bf35"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.17.0/phasegent-v2.17.0-aarch64-unknown-linux-gnu"
      sha256 "6d0125c17d777c454b33b022c1767e2c5e16e092063320ba28f2cdfeda9d66c4"
    end
    on_intel do
      url "https://github.com/cloudiful/phasegent/releases/download/v2.17.0/phasegent-v2.17.0-x86_64-unknown-linux-gnu"
      sha256 "e095804f0d92348b729794867c18f0224f6c0ab553e61adae89719d50b182bc6"
    end
  end

  livecheck do
    url :stable
    strategy :github_latest
  end

  def install
    bin.install Dir["phasegent-*"].first => "phasegent"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/phasegent --version")
  end
end
